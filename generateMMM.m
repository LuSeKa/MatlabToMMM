function [  ] = generateMMM( timeStamps, Poses, Positions )
%generateMMM Write Armar-4 MMM file from motion data
%   Writesn an MMM-compatible motion file for display in the MMMViewer.
%   Takes as input the vector of timestamps (in seconds), the global pose
%   (in mm and radian roll-pitch-yaw) and the joint angles of the 41
%   actuated joints (in radian)


filename = "generated.MMM";

poses = '';
positions = '';

for n = 1:length(timeStamps)
    poses = strcat(poses, generateGlobalPose(timeStamps(n), Poses(n,1:3), Poses(n,4:6)));
    positions = strcat(positions, generateJointPositions(timeStamps(n), Positions(n,:)));
end


%% Hard-coded MMM strings
Intro =[
'<?xml version="1.0" encoding="utf-8"?>\n'...
'<MMM version="2.0">\n'...
'	<Motion name="converted_subject_id_1721">\n'...
'		<Model path="/Armar4_model/armar4.xml"/>\n'...
'		<Sensors>\n'...
'			<Sensor type="ModelPose" version="1.0">\n'...
'				<Configuration/>\n'...
'				<Data> \n'];


Middle = [
'               </Data>\n'...
'			</Sensor>\n'...
'			<Sensor type="Kinematic" version="1.0">\n'...
'				<Configuration>\n'...
'					<Joint name="ArmL_Elb1_joint"/>\n'...
'					<Joint name="ArmL_Elb2_joint"/>\n'...
'					<Joint name="ArmL_Sho1_joint"/>\n'...
'					<Joint name="ArmL_Sho2_joint"/>\n'...
'					<Joint name="ArmL_Sho3_joint"/>\n'...
'					<Joint name="ArmL_Sho4_joint"/>\n'...
'					<Joint name="ArmL_Wri1_joint"/>\n'...
'					<Joint name="ArmL_Wri2_joint"/>\n'...
'					<Joint name="ArmR_Elb1_joint"/>\n'...
'					<Joint name="ArmR_Elb2_joint"/>\n'...
'					<Joint name="ArmR_Sho1_joint"/>\n'...
'					<Joint name="ArmR_Sho2_joint"/>\n'...
'					<Joint name="ArmR_Sho3_joint"/>\n'...
'					<Joint name="ArmR_Sho4_joint"/>\n'...
'					<Joint name="ArmR_Wri1_joint"/>\n'...
'					<Joint name="ArmR_Wri2_joint"/>\n'...
'					<Joint name="Head_1_joint"/>\n'...
'					<Joint name="Head_2_joint"/>\n'...
'					<Joint name="Neck_1_joint"/>\n'...
'					<Joint name="Neck_2_joint"/>\n'...
'					<Joint name="Neck_3_joint"/>\n'...
'					<Joint name="LegL_Ank1_joint"/>\n'...
'					<Joint name="LegL_Ank2_joint"/>\n'...
'					<Joint name="LegL_Heel_joint"/>\n'...
'					<Joint name="LegL_Hip1_joint"/>\n'...
'					<Joint name="LegL_Hip2_joint"/>\n'...
'					<Joint name="LegL_Hip3_joint"/>\n'...
'					<Joint name="LegL_Knee_joint"/>\n'...
'					<Joint name="LegL_Toe_joint"/>\n'...
'					<Joint name="LegL_Toe2_joint"/>\n'...
'					<Joint name="LegR_Ank1_joint"/>\n'...
'					<Joint name="LegR_Ank2_joint"/>\n'...
'					<Joint name="LegR_Heel_joint"/>\n'...
'					<Joint name="LegR_Hip1_joint"/>\n'...
'					<Joint name="LegR_Hip2_joint"/>\n'...
'					<Joint name="LegR_Hip3_joint"/>\n'...
'					<Joint name="LegR_Knee_joint"/>\n'...
'					<Joint name="LegR_Toe_joint"/>\n'...
'					<Joint name="LegR_Toe2_joint"/>\n'...
'					<Joint name="Torso_Pitch_joint"/>\n'...
'					<Joint name="Torso_Yaw_joint"/>\n'...
'				</Configuration>\n'...
'				<Data>\n'];
        
End = [
'				</Data>\n'...
'			</Sensor>\n'...
'		</Sensors>\n'...
'	</Motion>\n'...
'</MMM>'];

%% Write to file
fileID = fopen(filename,'w');
fprintf(fileID,'<!--This file was auto-generated with Matlab-->\n');
fileID = fopen(filename,'a');
fprintf(fileID, Intro);
fprintf(fileID, poses);
fprintf(fileID, Middle);
fprintf(fileID, positions);
fprintf(fileID, End);
fclose(fileID);

end

