function [ img_result ] = face_replacement_wrapper( img1, img2 )
%FACE_REPLACEMENT_WRAPPER
% This function takes in the two images img1 and img2 as inputs and
% replaces the face(s) detected in img1 with the face in img1

API_KEY = '6894a9492a127f5bc36e05763041a641';
API_SECRET = 'itKp-UPlCBwd3T4zhkllnkpin4GfJfqp';

api = facepp(API_KEY, API_SECRET);


[facerec_src,landmark_src, len_src_faces] = getLandmark(api,img1,1);


try
    [facerec_dest,landmark_dest, len_dest_faces] = getLandmark(api,img2,1);
catch
    warning('Could not detect face(s)')
    img_result = imread(img2);
    return
    
end

%landmark_dest = landmark_dest(1:83,:);


img1 = im2double(imread(img1));
img2 = im2double(imread(img2));
imwrite(img2, 'trial_122_123.jpg');

%Since we need to replace only 3 faces
% if len_dest_faces > 5
%     len_dest_faces = 5;
% end

for iter = 1:len_dest_faces
    %Get landmarks for each face
    landmark_dest2 = landmark_dest(1+((iter-1)*83):iter*83,:);
    %%
    
    img2 = im2double(imread('trial_122_123.jpg'));
    img_morphed = morph_tps_wrapper(img1*255, img2*255, landmark_src(1:83,:), landmark_dest2, 1, 0);
    img_morphed = img_morphed(1:size(img2,1),1:size(img2,2),:);
    
    img_morphed = im2double(img_morphed);
    [img_proc,mask] = defineRegion(img2,landmark_dest2);%,facerec_dest);
    img_morphed_proc = histeq_rgb(img_morphed, img2, mask, mask);
    
    sigma = round(1/15 * (facerec_dest(3)-facerec_src(1)));
    sigma = max(sigma,5);
    se = strel('square',sigma);
    %mask = imerode(mask,se);
    w = fspecial('gaussian',[50 50],sigma);
    mask = imfilter(double(mask),w);
    img_result = bsxfun(@times,double(img_morphed_proc),double(mask)) + bsxfun(@times,double(img2),double(1-mask));
    
    %figure,imshow(img_result);
    img2 = uint8(img_result*255);
    imwrite(img2, 'trial_122_123.jpg');
    clear img_morphed img_proc mask img_morphed_proc sigma se mask w mask
end

if isa(img_result, 'double')
    
    img_result = uint8(img_result*255);
end

end

