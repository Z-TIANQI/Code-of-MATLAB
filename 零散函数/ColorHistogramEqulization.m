function f = ColorHistogramEqulization(img)  
%img = imread(img);  
%[nHeight, nWidth, nDim] = size(img);  
r = img(:, :, 1);  
g = img(:, :, 2);  
b = img(:, :, 3);  
% �����Լ�д��ֱ��ͼ���⻯�����ֱ�� R G B ��������ֱ��ͼ���⻯  
R = MATLAB_assignment(r);  
G = MATLAB_assignment(g);  
B = MATLAB_assignment(b);  
f = cat(3, R, G, B);  
imshow(f);  
