{-# LANGUAGE ScopedTypeVariables #-}

module Config where

import Data.List 
import Data.Maybe

import Control.Applicative
import Control.Monad


import Distribution.Simple
import Distribution.Simple.BuildPaths

import Distribution.Simple.Setup
import Distribution.PackageDescription
import Distribution.Simple.LocalBuildInfo

import Distribution.System

import System.Exit
import System.Process

import System.FilePath
import System.Directory

import System.Info

fortranCompileHook :: UserHooks
fortranCompileHook = simpleUserHooks { 
  confHook = hookfunction, 
  instHook = hook4InstHook
} 

hook4InstHook :: PackageDescription -> LocalBuildInfo -> UserHooks -> InstallFlags -> IO () 
hook4InstHook pkg_descr lbi uhook flags = do 
  instHook simpleUserHooks pkg_descr lbi uhook flags
  let copyFlags = defaultCopyFlags { copyDistPref = installDistPref flags
                                   , copyDest     = toFlag NoCopyDest 
                                   , copyVerbosity = installVerbosity flags
                                   }
      copydest = fromFlag (copyDest (copyFlags))
      libPref = libdir . absoluteInstallDirs pkg_descr lbi $ copydest

  b <- return . and <=< mapM (checkLibFile libPref) $
      [ "LHAPDF", "Fmcfio", "exthep", "pgslib", "stdhep"
      , "tauola", "pythiaext" ] 
  putStrLn $ " BOOL = " ++ show b
  -- when (not b) $ do 
  tdir <- getTemporaryDirectory
  mapM_ (mkDynLibraries b (tdir </> "pythia-pgs.orig" </> "libraries" </> "lhapdf" </> "lib") libPref) ["LHAPDF"]
  mapM_ (mkDynLibraries b (tdir </> "pythia-pgs.orig" </> "libraries" </> "PGS4" </> "lib") libPref) [ "Fmcfio", "exthep", "pgslib", "stdhep", "tauola" ] 
  mapM_ (mkDynLibraries b (tdir </> "pythia-pgs.orig" </> "libraries" </> "pylib" </> "lib") libPref) [ "pythiaext" ]
  return ()


mkDynLibraries :: Bool -> FilePath -> FilePath -> String -> IO ()
mkDynLibraries isnew origdir libPref lname = do 
  let showCmdNRun c = putStrLn c >> system c
  let libfilename = "lib" ++ lname ++ ".a" 
      dylibfilename = "lib" ++ lname ++ ".dylib"
      sofilename = "lib" ++ lname ++ ".so"
      symbolfilename =  "lib" ++ lname ++ ".sym"
  when (not isnew) $ do 
    let cmd_mv_lib = "mv " ++ (origdir </> libfilename) ++ " " ++ libPref 
    showCmdNRun cmd_mv_lib
    return () 
  -- let cmd_mv_sym = "mv " ++ (origdir </> symbolfilename) ++ " " ++ libPref
  -- showCmdNRun cmd_mv_sym
  let cmd_mkdyn = case buildOS of 
        OSX -> "gcc -dynamiclib -o " ++ (libPref </> dylibfilename)
               ++ " -Wl,-exported_symbols_list," ++ (libPref</>symbolfilename) ++ ",-headerpad_max_install_names,-undefined,dynamic_lookup,-compatibility_version,1.0,-current_version,1.0 " 
                ++ (libPref </> libfilename)
        Linux -> "gcc -shared -o " 
                 ++ (libPref </> sofilename) 
                 ++ " -Wl,--whole-archive "
                 ++ (libPref </> libfilename)
        _ -> error "cannot handle this OS" 
  showCmdNRun cmd_mkdyn
  return ()  

checkLibFile :: FilePath -> String -> IO Bool 
checkLibFile fp str = do
  let staticlib = fp </> "lib" ++ str <.> "a" 
      dynlib = fp </> "lib" ++ str <.> (case buildOS of 
                                          OSX -> "dylib"
                                          Linux -> "so"
                                          _ -> error "cannot handle this OS")
  (&&) <$> doesFileExist staticlib <*> doesFileExist dynlib 

hookfunction :: (GenericPackageDescription, HookedBuildInfo) -> ConfigFlags -> IO LocalBuildInfo
hookfunction x cflags = do 
  -- let smplUsrHks = simpleUserHooks x y
  binfo <- confHook simpleUserHooks x cflags

  let pkg_descr = localPkgDescr binfo
  let iflags = defaultInstallFlags
  let copyFlags = defaultCopyFlags { 
                    copyDistPref = installDistPref iflags
                  , copyDest     = toFlag NoCopyDest 
                  , copyVerbosity = installVerbosity iflags
                  }
      copydest = fromFlag (copyDest (copyFlags))
      includedir = head . includeDirs . libBuildInfo . fromJust . library $ pkg_descr 
      libPref = libdir . absoluteInstallDirs pkg_descr binfo $ copydest
  
  b <- return . and <=< mapM (checkLibFile libPref) $
      [ "LHAPDF", "Fmcfio", "exthep", "pgslib", "stdhep"
      , "tauola", "pythiaext" ] 
  putStrLn $ "Bool in hookfunction : " ++ show b   

  tdir <- getTemporaryDirectory
  cdir <- getCurrentDirectory
  putStrLn $ tdir 
  putStrLn $ cdir 

  let showCmdNRun c = putStrLn c >> system c  
  let cmd_cp_sym x = "cp " ++ ( includedir  </> x) ++ " " ++ libPref
  mapM_ (showCmdNRun . cmd_cp_sym) [ "libLHAPDF.sym", "libFmcfio.sym"
                                   , "libexthep.sym", "libpgslib.sym"
                                   , "libstdhep.sym", "libtauola.sym"
                                   , "libpythiaext.sym" ] 

  when (not b) $ do
    system $ "tar xvzf " ++  (cdir </> "pythia-pgs/pythia-pgs.tar.gz") 
             ++ " -C " ++ tdir 
    setCurrentDirectory $ tdir </> "pythia-pgs.orig"
    system $ "make"
    setCurrentDirectory cdir 

  r_pbi <- if b  
             then config binfo (Just libPref) 
             else config binfo Nothing 
  let newbinfo = 
        case r_pbi of 
          Just pbi -> binfo { localPkgDescr = 
                                updatePackageDescription pbi pkg_descr }
          Nothing -> do 
            let r_lib = library pkg_descr 
            case r_lib of
              Just lib ->  
                let binfo2 = libBuildInfo lib
                    newlib = lib { libBuildInfo = binfo2 { cSources = [] }}  
                in  binfo {localPkgDescr = pkg_descr {library = Just newlib}}
              Nothing -> error "some library setting is wrong."  
  return newbinfo 

-- data TempOrNot = Temporary | Permanant FilePath

config :: LocalBuildInfo -> Maybe FilePath -> IO (Maybe HookedBuildInfo)
config bInfo tempornot = do 
  tdir <- getTemporaryDirectory
  putStrLn $ tdir 
  let Just lib = library . localPkgDescr $ bInfo
      buildinfo = libBuildInfo lib
      libdirs = case tempornot of 
                  Nothing -> [ tdir</>"pythia-pgs.orig"</>"libraries"</>"lhapdf"</>"lib"
                             , tdir</>"pythia-pgs.orig"</>"libraries"</>"PGS4"</>"lib"
                             , tdir</>"pythia-pgs.orig"</>"libraries"</>"pylib"</>"lib"
                             ]
                  Just dir -> [ dir ] 
  let hbi = emptyBuildInfo { extraLibs = extraLibs buildinfo 
                                         ++ ["LHAPDF","Fmcfio","exthep","pgslib","stdhep","tauola","pythiaext"]
                           , extraLibDirs = libdirs
                           }
  let (r :: Maybe HookedBuildInfo) = Just (Just hbi, []) 
  --  putStrLn $ show hbi
  return r 



