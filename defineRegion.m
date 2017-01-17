function [img_proc,mask] = defineRegion(img, landmark)

sz = size(img);
x= landmark(:,1);
y= landmark(:,2);
k = boundary(x,y,0);
mask = poly2mask(x(k), y(k), sz(1),sz(2));
img_proc = bsxfun(@times,im2double(img),double(mask));
