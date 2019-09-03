function f = ColorHistogramEqulization(img)  
%img = imread(img);  
%[nHeight, nWidth, nDim] = size(img);  
r = img(:, :, 1);  
g = img(:, :, 2);  
b = img(:, :, 3);  
% 调用自己写的直方图均衡化函数分别对 R G B 分量进行直方图均衡化  
R = MATLAB_assignment(r);  
G = MATLAB_assignment(g);  
B = MATLAB_assignment(b);  
f = cat(3, R, G, B);  
imshow(f);  
