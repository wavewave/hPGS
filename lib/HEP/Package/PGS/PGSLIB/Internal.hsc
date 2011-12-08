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


#ccall pgs_random_seed_ , Ptr CInt -> IO CInt
#ccall pgs_herwig_event_ , IO () 
#ccall pgs_alpher_event_ , IO () 
#ccall pgs_next_event_ , IO CInt 

#ccall pgs_read_event_ , IO CInt
#ccall pgs_ranmar_ , IO CFloat 
#ccall pgs_rannor_ , Ptr CFloat -> Ptr CFloat -> IO ()

#ccall pgs_trigger_ , IO ()
#ccall pgs_find_photon_electron_trig_ , IO ()
#ccall pgs_find_muon_trig_ , IO ()
#ccall pgs_find_tau_trig_ , IO () 
#ccall pgs_trigger_cal_isosum_ , Ptr CInt -> Ptr CFloat -> IO ()
#ccall pgs_track_assoc_ , Ptr CFloat -> Ptr CFloat -> Ptr CInt -> Ptr CInt -> Ptr CFloat -> Ptr CInt -> Ptr CFloat -> IO ()
#ccall pgs_find_jet_trig_ , IO ()
#ccall pgs_find_vertex_trig_ , IO ()
#ccall pgs_find_met_trig_ , IO ()
#ccall pgs_find_tracks_ , IO ()
#ccall pgs_track_res_ , Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> IO ()

#ccall pgs_fill_cal_ , IO ()
#ccall pgs_cal_crack_ , Ptr CDouble -> Ptr CDouble -> IO CInt 

#ccall pgs_find_trigger_clusters_ , IO ()
#ccall pgs_cone_jets_ , IO ()
#ccall pgs_kt_jets_ , IO ()
#ccall pgs_kt_dist_ , Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> IO CDouble

#ccall pgs_recon_ , IO ()
#ccall pgs_find_photon_electron_ , IO ()
#ccall pgs_trk_isosum_ , Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CInt -> Ptr CDouble -> Ptr CInt -> IO ()
#ccall pgs_eta_phi_hep_match_ , Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CInt -> Ptr CInt -> Ptr CInt -> IO ()
#ccall pgs_eta_phi_diff_ , Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> IO ()
#ccall pgs_tower_isosum_ , Ptr CInt -> Ptr CInt -> Ptr CDouble -> IO ()
#ccall pgs_find_muons_ , IO ()

#ccall pgs_muo_eff_ , Ptr CDouble -> IO CDouble

#ccall pgs_find_taus_ , IO ()
#ccall pgs_find_jets_ , IO ()
#ccall pgs_jet_flavor_tags_ , Ptr CInt -> Ptr CDouble -> IO ()
#ccall pgs_loose_btag_ , Ptr CInt -> Ptr CInt -> Ptr CInt -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> IO ()
#ccall pgs_tight_btag_ , Ptr CInt -> Ptr CInt -> Ptr CInt -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> IO ()
#ccall pgs_true_jet_type_ , Ptr CInt -> Ptr CInt -> Ptr CInt -> Ptr CInt -> IO ()
#ccall pgs_cluster_width_ , Ptr CInt -> IO ()
#ccall pgs_trigger_cluster_width_ , Ptr CInt -> IO ()
#ccall pgs_find_heavy_ , IO ()
#ccall pgs_heavy_eff_ , Ptr CDouble -> Ptr CFloat -> Ptr CFloat -> IO ()

#ccall et_obj_ , Ptr CInt -> IO ()
#ccall pt_obj_ , Ptr CInt -> IO ()
#ccall p_obj_ , Ptr CInt -> IO ()
#ccall eta_obj_ , Ptr CInt -> IO ()
#ccall phi_obj_ , Ptr CInt -> IO ()
#ccall et_gen_ , Ptr CInt -> IO ()
#ccall pt_gen_ , Ptr CInt -> IO ()
#ccall p_gen_ , Ptr CInt -> IO ()
#ccall eta_gen_ , Ptr CInt -> IO ()
#ccall phi_gen_ , Ptr CInt -> IO ()
#ccall et_clu_ , Ptr CInt -> IO ()
#ccall pt_clu_ , Ptr CInt -> IO ()
#ccall p_clu_ , Ptr CInt -> IO ()
#ccall eta_clu_ , Ptr CInt -> IO ()
#ccall phi_clu_ , Ptr CInt -> IO ()
#ccall et_trc_ , Ptr CInt -> IO ()
#ccall pt_trc_ , Ptr CInt -> IO ()
#ccall p_trc_ , Ptr CInt -> IO ()
#ccall eta_trc_ , Ptr CInt -> IO ()
#ccall phi_trc_ , Ptr CInt -> IO ()
#ccall et_trk_ , Ptr CInt -> IO ()
#ccall pt_trk_ , Ptr CInt -> IO ()
#ccall p_trk_ , Ptr CInt -> IO ()
#ccall eta_trk_ , Ptr CInt -> IO ()
#ccall phi_trk_ , Ptr CInt -> IO ()
#ccall cos_theta_ , Ptr CDouble -> Ptr CDouble -> IO CDouble
#ccall cos_del_phi_ , Ptr CDouble -> Ptr CDouble -> IO CDouble
#ccall del_phi_ , Ptr CDouble -> Ptr CDouble -> IO CDouble
#ccall v4mass_ , Ptr CDouble -> IO CDouble 
#ccall v4mass2_ , Ptr CDouble -> Ptr CDouble -> IO CDouble 
#ccall v4et_ , Ptr CDouble -> IO CDouble
#ccall v4p_ , Ptr CDouble -> IO CDouble
#ccall v4pt_ , Ptr CDouble -> IO CDouble 
#ccall v4eta_ , Ptr CDouble -> IO CDouble 
#ccall v4phi_ , Ptr CDouble -> IO CDouble 
#ccall pgs_etaphi_index_ , Ptr CDouble -> Ptr CDouble -> Ptr CInt -> Ptr CInt -> IO ()
#ccall pgs_index_etaphi_ , Ptr CInt -> Ptr CInt -> Ptr CDouble -> Ptr CDouble -> IO ()
#ccall pgs_dump_event_ , Ptr CInt -> Ptr CDouble -> Ptr CDouble -> IO ()
#ccall pgs_cor_met_ , IO ()
#ccall pgs_unique_id_ , IO ()
#ccall pgs_object_cuts_ , Ptr CInt -> IO CInt 
#ccall pgs_tau_decay_mode_ , Ptr CInt -> Ptr CInt -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CDouble -> Ptr CInt -> IO ()