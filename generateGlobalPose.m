function [ globalPoseString ] = generateGlobalPose( timeStamp, rootPosition, rootRotation )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

globalPoseString = [
    '					<Measurement timestep="',num2str(timeStamp),'">\n'...
    '						<RootPosition>',num2str(rootPosition(1)),' ',num2str(rootPosition(2)),' ',num2str(rootPosition(3)),'</RootPosition>\n'...
    '						<RootRotation>',num2str(rootRotation(1)),' ',num2str(rootRotation(2)),' ',num2str(rootRotation(3)),'</RootRotation>\n'...
    '					</Measurement>\n'];


end

