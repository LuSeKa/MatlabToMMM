close all

TimeStamps=[0.01 0.02];

Poses = [1 0 0 0 pi 0 
         0 0 0 0 0 0]; 
     
JointAngles = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
         
generateMMM(TimeStamps, Poses, JointAngles);
