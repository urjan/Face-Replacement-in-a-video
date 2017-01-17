clc;
close all;
clear all;

genpath('.');

img1 = './TargetImages/testFemale.jpg';
img2 = './TestSet/blending/Jennifer_lawrence_as_katniss-wide.jpg';
%img2 = imread(img2);

img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);
