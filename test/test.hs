import HEP.Package.PGS.PGSLIB.Internal

main :: IO ()
main = do 
  putStrLn "hPGS test"
  c'pgs_initialize_

