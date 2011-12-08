{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module HEP.Package.PGS.Olympics.FFI where
#strict_import 

#include "olympics.h"

#ccall mypgs_ , IO ()
