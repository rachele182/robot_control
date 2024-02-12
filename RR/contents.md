### <font color="green"> <span style="font-size:larger;"> Contents of RR: </font> </span>

Here after a brief description of the contents of the folder and instrunctions on how to run the files.  
The three main folders refer to the three different tasks simulated to test the planner on a planar RR robot. 
1. **RR_vertical_grasping** : the robot has to grasp an object from above, in this case the interaction is only on the y-axis; 
2. **RR_horizzontal_grasping**: the robot has to grasp an object from the side, in this case the interaction is on the x-axis and y-axis; 
3. **RR_placement**: the robot has to grasp the object from the side and place on a shelf guaranteeing requirements in terms of interaction forces and tracking steady-state-error. 

In the **movies** folder you can find mp4 files containing the videos of the different simulations described before. 
   
In each folder you can find the files 
   - **init.m**: matlab file to setup all the variables for simulation;  
   - **task_union.slx** : simulink file containing the simulation of the correspondant task;
   - **animazione_rr#_forces.m, animazione_rr#.m** : matlab scripts to plot the simulation of the RR executing the task, the first contains on the side a plot of the interaction forces;
   - **cin_dir.m**: matlab file containing the direct kinematics of RR;
   - **Jacobianoa.m,Jacobianoa_dot.m**: matlab files to compute RR analytic Jacobian and its derivative respectively;
   - **Coriolis.m,Gravity.m,Mass**: matlab files to compute dynamics of RR in terms of coriolis matrix, gravity vector and inertia matrix respectively;
   - **find_dk.m**: file us to initialize damping and stiffness factors.

**Instructions:**  
For each subfolder to run simulation you need to follow the same steps:  
    - run init.m file to setup the workspace;  
    - open the correspondant simulink file .slx and click on start simulation;   
    - click on the animation_rr.m scripts to visualize the animated task. 

**PS**: to run the simulink files a version of Matlab >=R2020a is needed. 
    

  
