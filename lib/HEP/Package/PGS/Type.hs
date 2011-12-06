{-# LANGUAGE DeriveDataTypeable #-}

module HEP.Package.PGS.Type where 

import System.Console.CmdArgs

data HPGS = Test 
              deriving (Show,Data,Typeable)

test :: HPGS
test = Test 

mode = modes [test]

