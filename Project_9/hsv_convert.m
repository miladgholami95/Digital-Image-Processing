function [hsv] = hsv_convert(w)
   hsv = rgb2hsv(w);%%

   H= double(hsv(:,:,1));
   S = double(hsv(:,:,2));
   V = double(hsv(:,:,3));
   result = zeros(size(H));
   one = ones(size(H));
   result=(H>= 0.0*one).* (H<=0.5*one).* (S >= 0.23*one).* (S <= 0.68*one).* (V>= 0.35*one).* (V <= 1*one);
   result (result ==1) = 255;
   hsv=result;

end

