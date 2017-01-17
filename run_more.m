clc;
close all;
clear all;

genpath('.');

img1 = 'ani.jpg';
%img1 = './TestSet/blending/b1.jpg';
img2 = './TestSet/more/burn-marvel-s-the-avengers.jpg';
img_result = face_replacement_wrapper_multi(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/more/jkweddingdance-jill_and_kevin_wedding_party.jpg';
img_result = face_replacement_wrapper_multi(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/more/marvels-the-avengers-wallpapers-01-700x466.jpg';
img_result = face_replacement_wrapper_multi(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all

img2 = './TestSet/more/real_madrid_2-wallpaper-960x600.jpg';
img_result = face_replacement_wrapper_multi(img1, img2);
figure, imshow(img_result);

disp('Press enter to continue');
pause;

close all
