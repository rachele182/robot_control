### <font color="green"> <span style="font-size:larger;"> Contents of franka: </font> </span>

Here after a brief description of the contents of the folder and instrunctions on how to run the files.  
The are three subfolders oragnized as follows: 
1. **franka-gripper_urdf-2021-02-25** : it contains all the .stl files of the robot used to create the animation files;
2. **functions**: it contains all the functions used in the simulation from the dynamic model of the robot to the geometric and analytical Jacobian matrices.
    - planner_gen.m, planner_interp.m = contain the functions of the impedance planner used to perform the task to achieve requirements in term of track performance and interaction forces; 
3. **matlab_original**: contains some utils file such as De Luca dynamic model and DH convention files used to calculate direct kinematics. 
   
The main files to refer to run the simulation of the placement task are: 

   - **init.m**: matlab file to setup all the variables for simulation;  
   - **test_control_franka.slx** : simulink file containing test of the control with some trajectories; 
   - **franka_placement_task.slx** : simulink file containing the main task; 
   - **animazione_franka_traiettoria.m**: script matlab to create the animation of the trajectories with impedance control; 
   - **animazione_franka.m**: script matlab to create the animation of the main placement task. 

**Instructions:**  
For each simulation you can follow the steps bolow:  
    - run init.m file to setup the workspace;  
    - open the correspondant simulink file .slx and click on start simulation;   
    - click on the animation_franka.m or animation_franka_traiettoria.m scripts to visualize the animation of the simulation just run.  

**PS**: to run the simulink files a version of Matlab >=R2020a is needed. 