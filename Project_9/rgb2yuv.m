function [YUV] = rgb2yuv(I,plot_flag)

RGB=I;
R = double(RGB(:,:,1));
G = double(RGB(:,:,2));
B = double(RGB(:,:,3));
%Conversion Formula
Y = 0.299   * R + 0.587   * G + 0.114 * B;
U = - 0.168736 * R - 0.331264 * G + 0.5 * B+128;
V = 0.5 * R - 0.418688 * G - 0.081312 * B+128;
%Y = 0.299 * R + 0.587 * G + 0.114 * B;
%U = -0.14713 * R - 0.28886 * G + 0.436 * B;
%V = 0.615 * R - 0.51499 * G - 0.10001 * B; 
if (plot_flag==1)       %plot figures
    figure();
    subplot(1,3,1);imshow(Y);title('Y');
    subplot(1,3,2);imshow(U);title('U');
    subplot(1,3,3);imshow(V);title('V');
end
YUV=cat(3,uint8(Y),uint8(U),uint8(V));
%YUV=rgb2ycbcr(RGB);

end

