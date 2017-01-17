clc;
close all;
clear all;

genpath('.');

img1 = 'ani.jpg';
img2 = './TestSet/pose/golden-globes-jennifer-lawrence-0.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/pose/Michael_Jordan_Net_Worth.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/pose/p1.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/pose/p2.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/pose/Pepper-and-Tony-tony-stark-and-pepper-potts-9679158-1238-668.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/pose/robert-downey-jr-5a.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/pose/star-trek-2009-sample-003.jpg';
img_result = face_replacement_wrapper(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all



