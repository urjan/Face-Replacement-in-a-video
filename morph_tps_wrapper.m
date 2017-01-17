function [morphed_im] = morph_tps_wrapper(im1, im2, im1_pts, im2_pts, warp_frac, dissolve_frac)
%resize the images
%im1 = imresize(im1,[size(im2,1) size(im2,2)],'bicubic'); % or 'linear', etc.
[rows1, cols1, temp] = size(im1);
[rows2, cols2, temp] = size(im2);

rows = max(rows1, rows2); 
cols = max(cols1, cols2);
im1_pad = padarray(im1, [rows-rows1, cols-cols1], 'replicate', 'post');
im2_pad = padarray(im2, [rows-rows2, cols-cols2], 'replicate', 'post');

%get the intermediate control points
inm_points = (1-warp_frac)*im1_pts + warp_frac*im2_pts;

%call est_tps for x and y for each image (total four times)
[a1_x1,ax_x1,ay_x1,w_x1] = est_tps(inm_points,im1_pts(:,1));
[a1_y1,ax_y1,ay_y1,w_y1] = est_tps(inm_points,im1_pts(:,2));
[a1_x2,ax_x2,ay_x2,w_x2] = est_tps(inm_points,im2_pts(:,1));
[a1_y2,ax_y2,ay_y2,w_y2] = est_tps(inm_points,im2_pts(:,2));

%get the new positions using fx(x,y) and fy(x,y) for each image
%[nr,nc,b]=size(im2);
sz= [rows, cols];
morphed_im1 = morph_tps(im1_pad, a1_x1, ax_x1, ay_x1, w_x1, a1_y1, ax_y1, ay_y1, w_y1, inm_points, sz);
morphed_im2 = morph_tps(im2_pad, a1_x2, ax_x2, ay_x2, w_x2, a1_y2, ax_y2, ay_y2, w_y2, inm_points, sz);

%cross-dissolve the images
morphed_im = (1-dissolve_frac)*morphed_im1 + dissolve_frac*morphed_im2;
morphed_im = uint8(morphed_im);
end

