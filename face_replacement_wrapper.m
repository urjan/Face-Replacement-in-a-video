function [ img_result ] = face_replacement_wrapper( img1, img2 )
%FACE_REPLACEMENT_WRAPPER
% This function takes in the two images img1 and img2 as inputs and
% replaces the face(s) detected in img1 with the face in img1

API_KEY = 'ca4f8b9e39394b96536d5d6de36f49d8';
API_SECRET = 'miY_PEMWJ_kZdQGQ-NUBQdMsbjYtsEBw';

api = facepp(API_KEY, API_SECRET,'US');


[facerec_src,landmark_src, ~] = getLandmark(api,img1,1);


try
    [facerec_dest,landmark_dest, len_dest_faces] = getLandmark(api,img2,1);
catch
    warning('No face detected!')
    img_result = imread(img2);
    return
    
end

img1 = im2double(imread(img1));
img2 = im2double(imread(img2));
imwrite(img2, 'temp.jpg');

%Since we need to replace only 3 faces
if len_dest_faces > 1
    len_dest_faces = 1;
end

for iter = 1:len_dest_faces
    %Get landmarks for each face
    landmark_dest2 = landmark_dest(1+((iter-1)*83):iter*83,:);
    %%
    
    img2 = im2double(imread('temp.jpg'));
    img_morphed = morph_tps_wrapper(img1*255, img2*255, landmark_src(1:83,:), landmark_dest2, 1, 0);
    img_morphed = img_morphed(1:size(img2,1),1:size(img2,2),:);
    
    img_morphed = im2double(img_morphed);
    [img_proc,mask] = defineRegion(img2,landmark_dest2);%,facerec_dest);
    img_morphed_proc = histeq_rgb(img_morphed, img2, mask, mask);
    
    sigma = round(1/15 * (facerec_dest(3)-facerec_src(1)));
    sigma = max(sigma,5);
    img_result = Lapla_blend(img_morphed_proc,img2,mask,sigma);
    
    %figure,imshow(img_result);
    img2 = uint8(img_result*255);
    imwrite(img2, 'temp.jpg');
    clear img_morphed img_proc mask img_morphed_proc sigma se mask w mask
end

if isa(img_result, 'double')
    
    img_result = uint8(img_result*255);
end

end

