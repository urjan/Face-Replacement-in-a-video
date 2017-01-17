
clc;
clear all;
close all;
genpath('.');

img1 = './TargetImages/teeth.jpg';

readObj = VideoReader('./TestSet/video/Proj4_Test/easy/easy4.mp4');
writeObj = VideoWriter('result_video.avi');

outputDir = './Results/video_files';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

nFrames = readObj.NumberOfFrames;
vidHeight = readObj.Height;
vidWidth = readObj.Width;

mov(1:nFrames) = struct('cdata',zeros(vidHeight,vidWidth, 3,'uint8'));

for k = 1 : nFrames
    mov(k).cdata = read(readObj,k);
end

disp('Starting face replacement');
writeObj.FrameRate = 10;
open(writeObj);

for i = 1:nFrames
    
    disp(['Iteration is :', num2str(i)]);
    img2 = mov(i).cdata;    
    imwrite(img2, fullfile(outputDir, 'frame.jpg'));
    imgInfo = dir(outputDir);
    imgInfo([imgInfo.isdir]) = [];
    img2 = strcat('./Results/video_files/', 'frame.jpg');
    img_result = face_replacement_wrapper(img1, img2);
    writeVideo(writeObj, img_result);
    
end

close(writeObj);
% 
% disp('Finished writing to dir');
% imgInfo = dir(outputDir);
% imgInfo([imgInfo.isdir]) = [];
% 
% info_length = length(imgInfo);
% 
% for j = 1:info_length
%     
%     img2 = strcat('./Results/video_files/', imgInfo(j).name);
%     img_result = face_replacement_wrapper(img1, img2);
%     imwrite(img_result, fullfile(outputDir, imgInfo(j).name));
%     
%     
% end