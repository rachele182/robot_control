//
//  Academic License - for use in teaching, academic research, and meeting
//  course requirements at degree granting institutions only.  Not for
//  government, commercial, or other organizational use.
//
//  planner_gen.h
//
//  Code generation for function 'planner_gen'
//


#ifndef PLANNER_GEN_H
#define PLANNER_GEN_H

// Include files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
void kc_not_empty_init();
void ki_not_empty_init();
extern double planner_gen(double F_ext, double z, double z_des, double dz_des,
  bool b_int, bool comp, double e_max, double F_max, double F_int_max);
void planner_gen_init();

#endif

// End of code generation (planner_gen.h)
