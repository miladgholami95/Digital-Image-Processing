function [yuv] = yuv_rgb(w)
R = double(w(:,:,1));
G = double(w(:,:,2));
B = double(w(:,:,3));
w=rgb2yuv(w,0);
y = double(w(:,:,1));
u = double(w(:,:,2));
v = double(w(:,:,3));
result = zeros(size(v));
one = ones(size(v));
result = (u > 80*one).*  (u < 130*one).* (v > 136*one).* (v < 200*one).* (v>u).*(R>80*one).* (G>30*one).* (B>15*one).* (abs(R-G)>15*one);
result (result ==1) = 255;
yuv=result;

end

