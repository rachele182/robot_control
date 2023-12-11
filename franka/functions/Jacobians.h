#ifndef JACOBIANS_H
#define JACOBIANS_H

void get_Ja_proj(const double q[7], double Ja[42]);

void get_Ja_dot_proj(const double q[7], const double dq[7], double Ja_dot[42]);

#endif