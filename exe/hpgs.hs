module Main where

import System.Console.CmdArgs

import HEP.Package.PGS.Type
import HEP.Package.PGS.Command

main :: IO () 
main = do 
  putStrLn "hPGS"
  param <- cmdArgs mode

  commandLineProcess param