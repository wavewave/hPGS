-- import HEP.Package.PGS.PGSLIB.Internal

import HEP.Package.PGS.Olympics.FFI

main :: IO ()
main = do 
  putStrLn "hPGS test"
  --  c'pgs_initialize_
  c'mypgs_

