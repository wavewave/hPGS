#! /usr/bin/env runhaskell

> import Distribution.Simple
> import Distribution.PackageDescription
> import Config 
> 
> main :: IO ()
> main = do 
>   defaultMainWithHooks fortranCompileHook
>

