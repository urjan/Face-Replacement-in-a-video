clc;
close all;
clear all;

genpath('.');

img1 = './TargetImages/ani.jpg';
img2 = './TestSet/blending/060610-beard-championships-bend-stroomer-0002.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/blending/b1.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/blending/bc.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/blending/Jennifer_lawrence_as_katniss-wide.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/blending/Michael-Jordan.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/blending/Official_portrait_of_Barack_Obama.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all



