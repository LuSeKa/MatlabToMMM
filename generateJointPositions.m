function [ jointPositionString ] = generateJointPositions( timeStamp, jointPositions )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

jointPositionString = [
'					<Measurement timestep="',num2str(timeStamp),'">\n'...    
'						<JointPosition>'];

for n = 1:length(jointPositions)
    jointPositionString = strcat(jointPositionString, num2str(jointPositions(n)),{' '});
    
end

jointPositionString = strcat(jointPositionString,['</JointPosition>\n'...
'					</Measurement>\n']);


jointPositionString = char(jointPositionString);

end

