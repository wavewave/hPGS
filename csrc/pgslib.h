#ifndef _PGSLIB_
#define _PGSLIB_

#include "fortran2c.h"

#ifdef __CPLUSPLUS
extern "C" { 
#endif // __CPLUSPLUS

  void FORTRANNAME(pgs_initialize)( void ) ;
  void FORTRANNAME(pgs_user_args)( void ) ;
  //  void FORTRANNAME(pgs_remove_comments)( ) ;   
  void FORTRANNAME(pgs_load_param)( void ) ; 
  void FORTRANNAME(pgs_init_herwig)( void ) ;
  void FORTRANNAME(pgs_init_alpher)( void ) ; 
  //  void FORTRANNAME(pgs_herwig_susy_file)( ); 
  //  int FORTRANNAME(pgs_random_seed)(); 
  void FORTRANNAME(pgs_herwig_event)( void ); 
  void FORTRANNAME(pgs_alpher_event)( void ); 
  //  logical FORTRANNAME(pgs_next_event)(); 
  //  void FORTRANNAME(pgs_write_event)();
  //  logical FORTRANNAME(pgs_read_event);
  //  function pgs_ranmar(); 
  //  subroutine pgs_rannor(a,b); 
  //  subroutine RANMAR(); 
  void FORTRANNAME(pgs_trigger)(void); 
  void FORTRANNAME(pgs_find_photon_electron_trig)(void); 
  void FORTRANNAME(pgs_find_muon_trig)(void); 
  void FORTRANNAME(pgs_find_tau_trig)(void); 
  //  subroutine pgs_trigger_cal_isosum(itrc,sum); 
  //  subroutine pgs_track_assoc(eta,...); 
  void FORTRANNAME(pgs_find_jet_trig)(void);
  void FORTRANNAME(pgs_find_vertex_trig)(void);
  void FORTRANNAME(pgs_find_met_trig)(void);
  void FORTRANNAME(pgs_find_tracks)(void);
  // subroutine pgs_track_res(p,q,pnew,qnew);
  void FORTRANNAME(pgs_fill_cal)(void); 
  // logical function pgs_cal_crack(eta,phi);
  void FORTRANNAME(pgs_find_trigger_clusters)(void); 
  void FORTRANNAME(pgs_cone_jets)(void);
  void FORTRANNAME(pgs_kt_jets)(void);
  // real*7 function pgs_kt_dist(p1,...); 
  void FORTRANNAME(pgs_recon)(void); 
  void FORTRANNAME(pgs_find_photon_electron)(void); 
  // subroutine pgs_trk_isosum(eta,...); 
  // subroutine pgs_eta_phi_hep_match(eta,...); 
  // subroutine pgs_eta_phi_diff(...); 
  // subroutine pgs_tower_isosum(...); 
  void FORTRANNAME(pgs_find_muons)(void); 
  // real*8 function pgs_muo_eff ; 
  void FORTRANNAME(pgs_find_taus)(void);
  void FORTRANNAME(pgs_find_jets)(void);
  // subroutine pgs_jet_flavor_tags(jet,zvertex);
  // subroutine pgs_loose_btag(type,...); 
  // subroutine pgs_tight_btag(type,...); 
  // subroutine pgs_true_jet_type(jet...);
  // function pgs_cluster_width(iclu); 
  // function pgs_trigger_cluster_width(itrc); 
  void FORTRANNAME(pgs_find_heavy)(void); 
  // subroutine pgs_heavy_eff(v4,eff,trigeff);
  // function et_obj(iobj);
  // function pt_obj(iobj);
  // function p_obj(iobj);
  // function eta_obj(iobj); 
  // function phi_obj(iobj); 
  // function et_gen(ihep); 
  // function pt_gen(ihep); 
  // function p_gen(ihep); 
  // function eta_gen(ihep); 
  // function phi_gen(ihep); 
  // function et_clu(iclu); 
  // function pt_clu(iclu); 
  // function p_clu(iclu); 
  // function eta_clu(iclu); 
  // function phi_clu(iclu); 
  // function et_trc(itrc); 
  // function pt_trc(itrc); 
  // function p_trc(itrc); 
  // function eta_trc(itrc); 
  // function phi_trc(itrc); 
  // function et_trk(itrk); 
  // function pt_trk(itrk); 
  // function p_trk(itrk); 
  // function eta_trk(itrk); 
  // function phi_trk(itrk); 
  // real*8 function cos_theta(p,q); 
  // real*8 function cos_del_phi(p,q); 
  // real*8 function del_phi(p,q);
  // real*8 function v4mass(p);
  // real*8 function v4mass2(p,q);
  // real*8 function v4et(p);
  // real*8 function v4p(p);
  // real*8 function v4pt(p);
  // real*8 function v4eta(p); 
  // real*8 function v4phi(p); 
  // subroutine pgs_etaphi_index(eta,phi,ieta,iphi); 
  // subroutine pgs_index_etaphi(ieta,iphi,eta,phi);
  // subroutine pgs_dump_event(mask,hepcut,calcut); 
  void FORTRANNAME(pgs_cor_met)(void); 
  void FORTRANNAME(pgs_unique_id)(void);
  // logical function pgs_object_cuts(iobj);
  // subroutine pgs_tau_decay_mode(jtau...); 



#ifdef __CPLUSPLUS
}
#endif // __CPLUSPLUS

#endif // _PGSLIB_


