{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module HEP.Package.PGS.PGSLIB.Internal where
#strict_import

#include "pgslib.h"

-- foreign import ccall "pgslib.h pgs_initialize" c_pgs_initialize
--  :: IO ()

#ccall pgs_initialize_ , IO ()
#ccall pgs_user_args_ , IO () 

#ccall pgs_load_param_ , IO ()
#ccall pgs_init_herwig_ , IO ()
#ccall pgs_init_alpher_ , IO ()

#ccall pgs_herwig_event_ , IO ()
#ccall pgs_alpher_event_ , IO () 

#ccall pgs_trigger_ , IO ()
#ccall pgs_find_photon_electron_trig_ , IO ()
#ccall pgs_find_muon_trig_ , IO ()
#ccall pgs_find_tau_trig_ , IO () 

#ccall pgs_find_jet_trig_ , IO ()
#ccall pgs_find_vertex_trig_ , IO ()
#ccall pgs_find_met_trig_ , IO ()
#ccall pgs_find_tracks_ , IO ()

#ccall pgs_fill_cal_ , IO ()

#ccall pgs_find_trigger_clusters_ , IO ()
#ccall pgs_cone_jets_ , IO ()
#ccall pgs_kt_jets_ , IO ()

#ccall pgs_recon_ , IO ()
#ccall pgs_find_photon_electron_ , IO ()

#ccall pgs_find_muons_ , IO ()

#ccall pgs_find_taus_ , IO ()
#ccall pgs_find_jets_ , IO ()

#ccall pgs_find_heavy_ , IO ()

#ccall pgs_cor_met_ , IO ()
#ccall pgs_unique_id_ , IO ()
