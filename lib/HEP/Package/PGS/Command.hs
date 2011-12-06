module HEP.Package.PGS.Command where

import HEP.Package.PGS.Type
import HEP.Package.PGS.Job

commandLineProcess :: HPGS -> IO ()
commandLineProcess Test = do 
  putStrLn "test called"
  startJob
