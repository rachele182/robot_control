<div align="center">

# Robot Control — Variable Impedance Modulation with Inertia Shaping 

**Online impedance control for safe human-robot interaction with a Franka Emika Panda**

**Authors:** Rachele Nebbia Colomba · Chiara Sammarco · Giorgio Simonini

*Final project — MSc course "Robot Control" · Robotics and Automation Engineering, Università di Pisa*

[![MATLAB](https://img.shields.io/badge/MATLAB-Simulink-orange)](https://www.mathworks.com/products/simulink.html)
[![C++](https://img.shields.io/badge/C%2B%2B-libfranka-blue)](https://frankaemika.github.io/libfranka/)
[![ROS](https://img.shields.io/badge/ROS-Node%20based-green?logo=ros)](https://www.ros.org/)
[![Hardware](https://img.shields.io/badge/Hardware-Franka%20Panda-red)](#)

</div>

---

## Overview

Final project for the **Robot Control** course (MSc Robotics and Automation Engineering, **Università di Pisa**).

We design an **online planner** for a **variable impedance controller** of a **7-DoF manipulator**. The goal: modulate impedance gains **online** to enable **safe interaction** with a *partially unknown environment*, while preserving good **tracking performance**. The overall scheme combines an **impedance planner** with an **impedance controller**.

The work progresses from a simplified model up to a real robot:

1. **Motivational examples** (interaction + grasping) on a simplified **mass–damper–spring** system;
2. Simulations of the planner on an **RR planar robot**;
3. Simulations of the planner on a **7-DoF Franka Emika Panda**.

## Repository Structure

```
.
├── mass_spring_damper/   # MATLAB/Simulink - simplified system
├── RR/                   # MATLAB/Simulink - interaction tasks (RR planar robot)
├── franka/               # Simulation of a placement task on 7-DoF Franka Panda
└── README.md
```

> ▶️ See **`contents.md`** inside each folder for file descriptions and run instructions.
> 📦 Requires **Simulink ≥ R2020a**.

## Real-Robot Lab Experiments 🔬

The proposed framework was also validated through a **real placement task on a 7-DoF Franka Emika Panda** robot.

- Carried out at **Centro di Ricerca "E. Piaggio"**, Dipartimento di Ingegneria, **Università di Pisa**;
- Communication via **libfranka** and the **Franka ROS** interface;
- The planner and the impedance controller were implemented as **ROS nodes**.

> ⚖️ *For copyright reasons, the C++ and ROS files of the live experiment are not uploaded here.*

<div align="center">
  <img src="https://github.com/rachele182/robot_control/assets/75611841/f40f21c2-5fe6-4db7-9361-713ebe883019" width="425">
  <br/>
  <em>Overview of the experiment setup.</em>
</div>

## Highlights

- **Variable impedance control with inertia shaping** — modulates impedance online for safe, adaptable physical interaction;
- **Safe human-robot interaction** with partially unknown environments (transfers well to collaborative robotics);
- Progressive validation: mass–spring–damper → RR planar robot → **7-DoF Franka Panda** (simulation **and** real hardware);
- Same control theme as the author's master-thesis research on admittance/impedance control.

## Key Skills & Tools

| Area               | What it demonstrates                               |
|--------------------|----------------------------------------------------|
| Control            | Variable impedance, inertia shaping, torque control |
| Interaction        | Safe physical HRI, online adaptive gains           |
| Hardware           | Franka Emika Panda (7-DoF), libfranka + FCI        |
| Software           | C++, ROS nodes, MATLAB / Simulink                  |
| Validation         | Progressive: simulation → real robot               |

## About

**Variable impedance modulation with inertia shaping** for a 7-DoF manipulator — online adaptive impedance control for safe interaction with unknown environments, validated in simulation and on a **real Franka Panda** via **libfranka + ROS** (MATLAB/Simulink).
