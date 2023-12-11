### <font color="green"> <span style="font-size:larger;"> Contents of MDS: </font> </span>

Here afther a brief description of the contents of the folder and instrunctions on how to run the files.  
The three folders refer to the three preliminary tasks simulated to test the planner:

1. **MDS_grasping** : 
   - **init.m**: matlab file to setup all the variables for simulation;  
   - **MDS_grasping.slx** : simulink file containing the simulation of the grasping task;
   - **stableMDS_variables_stiffness.slx** : simulink file with grasping simulation with stability condition check; 

2. **MDS_interaction** :  
   - **init.m**: matlab file to setup all the variables for simulation;  
   - **MDS_interaction.slx** : simulink file containing the simulation of the interaction task with a partially unknown environment;

3. **MDS_instability** *:  
   - **init.m**: matlab file to setup all the variables for simulation;  
   - **MDS_antibouncing.slx** : simulink file containing the simulation where stifsness variation is computed to limit the oscillations;
   - **MDS_variableD.slx** : simulink file continaining a variation on the damping factor to limit peak response to an initial velocity condition.

*there are use case studies used to study the behaviour of a mass-damper-spring system in free response to a predefined initial condition. 

**Instrunctions:**  
For each simulation you need to follow the same steps:  
    - run init.m file to setup the workspace;  
    - open the correspondant simulink file .slx and click on start simulation;   
    - click on the scope blocks to visulaze the result. 
    

  