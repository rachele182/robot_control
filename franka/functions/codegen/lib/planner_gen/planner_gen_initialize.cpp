//
//  Academic License - for use in teaching, academic research, and meeting
//  course requirements at degree granting institutions only.  Not for
//  government, commercial, or other organizational use.
//
//  planner_gen_initialize.cpp
//
//  Code generation for function 'planner_gen_initialize'
//


// Include files
#include "planner_gen_initialize.h"
#include "planner_gen.h"
#include "planner_gen_data.h"

// Function Definitions
void planner_gen_initialize()
{
  kc_not_empty_init();
  ki_not_empty_init();
  planner_gen_init();
  isInitialized_planner_gen = true;
}

// End of code generation (planner_gen_initialize.cpp)
