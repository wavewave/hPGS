module HEP.Package.PGS.Job where

-- import HEP.Package.PGS.PGSLIB.Internal

startJob :: IO () 
startJob = do 
  putStrLn "job started"
--  c_pgs_initialize
