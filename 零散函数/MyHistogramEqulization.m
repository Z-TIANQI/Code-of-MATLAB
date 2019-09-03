function f = MyHistogramEqulization(img)  
[nheight, nwidth, nDim] = size(img);  
if nDim == 3  
    img = rgb2gray(img);  
end  
%height = size(img, 1);  
%width = size(img, 2);  
% ͼ�������е����صĸ���  
numPixel = nheight * nwidth;  
% �����Ҷȳ��ֵ�Ƶ��  
frequency = zeros(256, 1);  
% �����Ҷȳ��ֵĸ���  
probability = zeros(256, 1);  
% ͳ�Ƹ����Ҷȵ�Ƶ������������Ҷȵĸ���  
for i = 1:nheight  
    for j = 1:nwidth  
        value(i,j) = im2double(img(i,j));  
        frequency(value(i,j) + 1) = frequency(value(i,j) + 1) + 1;  
        probability(value(i,j) + 1) = frequency(value(i,j) + 1) / numPixel;  
    end  
end  
% �����Ҷȵ��ۻ��ֲ�  
fPixel = zeros(256, 1);  
% �����Ҷȵ��ۻ��ֲ�����  
pPixel = zeros(256, 1);  
% ���¶���ĻҶ�ֵ  
imgNew = zeros(256, 1);  
% �ۻ��ͱ���  
sum = 0;  
for i = 1:size(probability)  
    sum = sum + frequency(i);  
    fPixel(i) = sum;  
    pPixel(i) = fPixel(i) / numPixel;  
    % ����ӳ��ĻҶ�ֵ  
    imgNew(i) = round(pPixel(i) * 255);  
end  
% �����µ�ͼ�����顣 uint8 ��ָ���� 8 λͼ�����飬��Լ�洢�ռ䡣  
f = uint8(zeros(nheight, nwidth));  
for i = 1:nheight  
    for j = 1:nwidth  
        f(i, j) = imgNew(img(i, j) + 1);  
    end  
end  