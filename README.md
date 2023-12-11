### <font color="green"> <span style="font-size:larger;"> Robot Control </font>


<font color="green">**Authors**:</font>  Rachele Nebbia Colomba, Chiara Sammarco, Giorgio Simonini  
<font color="green">**Title**:</font> Variable Impedance Modulation with Inertia Shaping

This work is a result of the final project for the Master Course "Robot Control", as part of the Robotics and Automation Master Degree at the *Universita´di Pisa*.  
We focuse on the design of an online planner for a variable impedance controller of a 7-dof manipulator.  
The goal is to modulate online the impedance gains to have safe interaction with a partially unknown environment while at the same time guaranteeing good tracking performance.  
The overall scheme consists of an impedance planner and an impedance controller.  
Firstly we created motiviational examples (interaction + grasping tasks) on a simplified mass-damper-spring system; then simulations of the designed planner were carried out on RR planar robot; finally simulations of the designed planner were carried out on 7-DOF Franka Emika Panda Robots.


The project contains three main repos: 

&#x1F538; **mass_spring_damper** : containes all the Matlab and Simulink files related to the simplified system.  

&#x1F538; **RR**: containes all the Matlab and Simulink files to run different interaction tasks with the proposed planner and controller.

&#x1F538;**franka**: containes all the code needed to run the simulation of a placement task for a 7-dof Franka Emika Panda. 

All the simulations are tested and validated using Matlab/Simulink environment.  
Please note that to run the simulation a version of simulink >=R2020a is needed.  
Instructions and guide trough the files are in the **contents.md** inside each folder. 

<img src="https://github.com/rachele182/robot_control/assets/75611841/f40f21c2-5fe6-4db7-9361-713ebe883019" width="425">


P.S:  
**Lab Experiments**  
The proposed framework was validated also trough a placement task on a real 7Dof Franka Emika Panda robot.  
The experiments were carried out at *Centro di Ricerca Enrico Piaggio* at Dipartimento di Ingegneria, Universita´di Pisa using **libfranka** and **Franka Ros** interface to communicate with the robot. All the blocks including the planner and the impedance controller were implemented as nodes using Robot Operating System (ROS).  
An overview of the experiment setups is shown in the figure above.  

For copyright reason we do not upload here the c++ code and ros files of the live experiment. 


