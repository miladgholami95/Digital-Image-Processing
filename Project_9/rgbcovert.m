function [rgb] = rgbcovert(w)
   R = double(w(:,:,1));
   G = double(w(:,:,2));
   B = double(w(:,:,3));
   result = zeros(size(R));
   one = ones(size(R));
   
   result = (R > 95*one).* (G > 40*one).* (B > 20*one).*((max(max(R,G),B)-(min(min(R,G),B)))>15*one).* (abs(R-G)>15*one) .* (R > G) .* (R > B);
   result (result ==1) = 255;
   rgb=result;

end

