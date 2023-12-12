//
//  Academic License - for use in teaching, academic research, and meeting
//  course requirements at degree granting institutions only.  Not for
//  government, commercial, or other organizational use.
//
//  planner_gen.cpp
//
//  Code generation for function 'planner_gen'
//


// Include files
#include "planner_gen.h"
#include "planner_gen_data.h"
#include "planner_gen_initialize.h"
#include <cmath>

// Variable Definitions
static double ki;
static bool ki_not_empty;
static double kc;
static bool kc_not_empty;
static double F_comp;
static bool int_prec;
static bool comp_prec;
static double z_int;
static double z_int_dir;
static double set_F_comp;

// Function Definitions
void kc_not_empty_init()
{
  kc_not_empty = false;
}

void ki_not_empty_init()
{
  ki_not_empty = false;
}

double planner_gen(double F_ext, double z, double z_des, double dz_des, bool
                   b_int, bool comp, double e_max, double F_max, double
                   F_int_max)
{
  double d;
  double k;
  if (!isInitialized_planner_gen) {
    planner_gen_initialize();
  }

  //  Description
  //  Set the K coefficient for a variable impedance controller based on a
  //  desired trajectory
  //  Outputs
  //  k             stiffness
  //  Inputs
  //  F_ext         measured external force
  //  z_des         desired trajectory
  //  z             current position
  //  int, comp     booleans for the interaction and compensation phase
  //  Parameters
  //  F_int_max     desired interaction force
  //  F_max         nominal disturbance forces
  //  e_max         maximum steady-state error
  //  persistent initialization
  if (!ki_not_empty) {
    ki = F_max / e_max;
    ki_not_empty = true;

    //  k obtained from interaction
  }

  if (!kc_not_empty) {
    kc = F_max / e_max;
    kc_not_empty = true;

    //  k obtained from compensation
  }

  //  INTERACTION
  //  set ki in order to match a desired interaction force with the
  //  envirorment, and store interaction's position when detected
  //  X axes
  if (b_int) {
    double ktemp_x;

    //  detection of an interaction
    ktemp_x = F_ext - F_comp;
    d = std::abs(ktemp_x);
    if ((d > F_max) && (z_int == 1000.0)) {
      //  z_int has not been set yet
      z_int = z;
      if (ktemp_x < 0.0) {
        ktemp_x = -1.0;
      } else if (ktemp_x > 0.0) {
        ktemp_x = 1.0;
      } else {
        if (ktemp_x == 0.0) {
          ktemp_x = 0.0;
        }
      }

      z_int_dir = -ktemp_x;
      set_F_comp = 0.0;
    }

    //  setting of ki
    if (d > F_int_max) {
      //  if interaction force is higher than threshold
      d = std::abs(z - z_des);
      if (ki * d > F_int_max) {
        ktemp_x = F_int_max / d;
        if (ktemp_x < ki) {
          //  ki needs to be only decreased
          ki = ktemp_x;
        }
      }
    }
  }

  //  COMPENSATION
  //  set kc in order to compensate the effect of the weight of the object,
  //  and store it
  //  X axes
  if (comp) {
    //  compensation detection
    if (z_int == 1000.0) {
      //  z_int not set before
      d = std::abs(F_ext);
      if (d / kc > e_max) {
        kc = d / e_max;
        if (set_F_comp > 0.1) {
          F_comp = F_ext;
        }
      }
    } else if (z_int_dir == 1.0) {
      //  obstacle in above
      if ((z < z_int) && (std::abs(F_ext) / kc > e_max)) {
        kc = std::abs(F_ext) / e_max;
        if (set_F_comp > 0.1) {
          F_comp = F_ext;
        }
      }
    } else {
      //  obstacle is below
      if ((z > z_int) && (std::abs(F_ext) / kc > e_max)) {
        kc = std::abs(F_ext) / e_max;
        if (set_F_comp > 0.1) {
          F_comp = F_ext;
        }
      }
    }
  }

  //  reset to default values when comp or int shifts to zero
  if ((!comp) && comp_prec) {
    kc = F_max / e_max;
    F_comp = 0.0;
    set_F_comp = 0.0;
  }

  if ((!b_int) && int_prec) {
    ki = F_max / e_max;
  }

  //  from int to comp and vice versa
  if (b_int && (!int_prec)) {
    if (comp_prec) {
      ki = kc;
    }

    z_int = 1000.0;
    z_int_dir = 0.0;
  }

  if (comp && (!comp_prec)) {
    if (int_prec) {
      kc = ki;
    }

    set_F_comp = 1.0;
  }

  //  update to last booleans
  int_prec = b_int;
  comp_prec = comp;

  //  Selection of Final Values of D-K
  //  default values
  k = std::abs(F_max) / e_max;

  //  compensation
  if (comp) {
    k = kc;
  }

  //  both compensation and interaction are activated
  //  if "away" from obstacle set k = kc else ki
  if (b_int) {
    k = ki;
    if (comp) {
      if (z_int == 1000.0) {
        k = kc;

        //  obstacle not reached
      } else if (z_int_dir == 1.0) {
        if ((z_des < z_int) && (dz_des < 0.0)) {
          k = kc;

          //  obstacle reached but "going away"
        }
      } else {
        if ((z_des > z_int) && (dz_des * z_int_dir < 0.0)) {
          k = kc;

          //  obstacle reached but "going away"
        }
      }
    } else if (z_int == 1000.0) {
      k = F_max / e_max;

      //  restore to default
    } else if (z_int_dir == 1.0) {
      if (z_des < z_int) {
        k = F_max / e_max;

        //  restore because "going away"
      }
    } else {
      if (z_des > z_int) {
        k = F_max / e_max;

        //  restore because "going away"
      }
    }
  }

  return k;
}

void planner_gen_init()
{
  F_comp = 0.0;

  //  weight to compensate
  z_int = 1000.0;

  //  obstacle(or interaction) position
  z_int_dir = 0.0;

  //  prohibited direction due to the obstacle
  //      int_prec = 0;
  int_prec = false;

  //  previous values of int
  //      comp_prec = 0;
  comp_prec = false;

  //  previous values od comp
  set_F_comp = 1.0;
}

// End of code generation (planner_gen.cpp)
