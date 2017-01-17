function [ blended_img ] = Lapla_blend( im1,im2, mask, sigma)
se = strel('square',sigma);
mask = imerode(mask,se);
%filter = [0,-1,0;-1,4,-1;0,-1,0];
%w = fspecial(filter,[50 50],sigma);
%mask = imfilter(double(mask),filter);
%blended_img = bsxfun(@times,double(im1),double(mask)) + bsxfun(@times,double(im2),double(1-mask));

%%%% Now do Laplacian blending
blended_img = LaplacianBlend(im2, im1, mask);
end

