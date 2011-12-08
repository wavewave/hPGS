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
  int  FORTRANNAME(pgs_random_seed)( int* ij ); 
  void FORTRANNAME(pgs_herwig_event)( void ); 
  void FORTRANNAME(pgs_alpher_event)( void ); 
  int  FORTRANNAME(pgs_next_event)( void );
  //  void FORTRANNAME(pgs_write_event)();
  int  FORTRANNAME(pgs_read_event)( void );
  float FORTRANNAME(pgs_ranmar)( void ); 
  void FORTRANNAME(pgs_rannor)( float* a, float* b); 
  //  subroutine RANMAR(); 
  void FORTRANNAME(pgs_trigger)(void); 
  void FORTRANNAME(pgs_find_photon_electron_trig)(void); 
  void FORTRANNAME(pgs_find_muon_trig)(void); 
  void FORTRANNAME(pgs_find_tau_trig)(void); 
  void FORTRANNAME(pgs_trigger_cal_isosum)(int* itrc,float* sum); 
  
  void FORTRANNAME(pgs_track_assoc)(float* eta, float* phi,
                                    int* iseed, int* n10,
                                    float* ptmax, int* nsio,
                                    float* ptmaxiso); 
  
  void FORTRANNAME(pgs_find_jet_trig)(void);
  void FORTRANNAME(pgs_find_vertex_trig)(void);
  void FORTRANNAME(pgs_find_met_trig)(void);
  void FORTRANNAME(pgs_find_tracks)(void);
  //void FORTRANNAME(pgs_track_res)(double p[3], double* q,
  //                                double pnew[3], double* qnew);
  void FORTRANNAME(pgs_fill_cal)(void); 

  int  FORTRANNAME(pgs_cal_crack)(double* eta,double* phi);

  void FORTRANNAME(pgs_find_trigger_clusters)(void); 
  void FORTRANNAME(pgs_cone_jets)(void);
  void FORTRANNAME(pgs_kt_jets)(void);
  // real*8 function pgs_kt_dist(p1,...); 
  void FORTRANNAME(pgs_recon)(void); 
  void FORTRANNAME(pgs_find_photon_electron)(void); 

  void FORTRANNAME(pgs_trk_isosum)(double* eta, double* phi,
                                   double* r, double* ptsum,
                                   int* nsum, double* ptmax,
                                   int* itrmax);
  void FORTRANNAME(pgs_eta_phi_hep_match)(double* eta, double* phi,
                                          double* ptcut, int* id,
                                          int *msign, int* ind);
  void FORTRANNAME(pgs_eta_phi_diff)(double* eta1, double* phi1,
                                     double* eta2, double* phi2,
                                     double* diff); 
  void FORTRANNAME(pgs_tower_isosum)(int* ieta,int* iphi,double* sum); 
  void FORTRANNAME(pgs_find_muons)(void); 
  // real*8 function pgs_muo_eff ; 
  void FORTRANNAME(pgs_find_taus)(void);
  void FORTRANNAME(pgs_find_jets)(void);
  void FORTRANNAME(pgs_jet_flavor_tags)(int* jet,double* zvertex);
  void FORTRANNAME(pgs_loose_btag)(int* type, int* c_in_cone, 
                                   int* b_in_cone, double* etjin,
                                   double* etaj, double* efftag); 
  // subroutine pgs_tight_btag(type,...); 
  // subroutine pgs_true_jet_type(jet...);
  // function pgs_cluster_width(iclu); 
  // function pgs_trigger_cluster_width(itrc); 
  void FORTRANNAME(pgs_find_heavy)(void); 
  // subroutine pgs_heavy_eff(v4,eff,trigeff);
  void FORTRANNAME(et_obj)(int* iobj);
  void FORTRANNAME(pt_obj)(int* iobj);
  void FORTRANNAME(p_obj)(int* iobj);  
  void FORTRANNAME(eta_obj)(int* iobj);
  void FORTRANNAME(phi_obj)(int* iobj);
  void FORTRANNAME(et_gen)(int* ihep); 
  void FORTRANNAME(pt_gen)(int* ihep); 
  void FORTRANNAME(p_gen)(int* ihep); 
  void FORTRANNAME(eta_gen)(int* ihep); 
  void FORTRANNAME(phi_gen)(int* ihep); 
  void FORTRANNAME(et_clu)(int* iclu); 
  void FORTRANNAME(pt_clu)(int* iclu); 
  void FORTRANNAME(p_clu)(int* iclu); 
  void FORTRANNAME(eta_clu)(int* iclu); 
  void FORTRANNAME(phi_clu)(int* iclu); 
  void FORTRANNAME(et_trc)(int* itrc); 
  void FORTRANNAME(pt_trc)(int* itrc); 
  void FORTRANNAME(p_trc)(int* itrc); 
  void FORTRANNAME(eta_trc)(int* itrc); 
  void FORTRANNAME(phi_trc)(int* itrc); 
  void FORTRANNAME(et_trk)(int* itrk); 
  void FORTRANNAME(pt_trk)(int* itrk); 
  void FORTRANNAME(p_trk)(int* itrk); 
  void FORTRANNAME(eta_trk)(int* itrk); 
  void FORTRANNAME(phi_trk)(int* itrk); 
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
  int  FORTRANNAME(pgs_object_cuts)(int* iobj);
  // subroutine pgs_tau_decay_mode(jtau...); 



#ifdef __CPLUSPLUS
}
#endif // __CPLUSPLUS

#endif // _PGSLIB_


