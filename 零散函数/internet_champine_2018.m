clc;clear;
srcImage = imread('C:\Users\87689\Desktop\2018认证杯网络挑战赛第二阶段赛题\B2\图2.jpg');

i=0;
img=imcrop(srcImage,[0 0 200 2488]);
img1=imcrop(srcImage,[0 2999 3731-2999 2488]);

for row=0:200:2999
    if (row+200)>2999
        break;
    end
    i=i+1;
    cropedImage=imcrop(srcImage,[row 0 200 2488]);
    f=im2double(cropedImage);
    PSF = fspecial('motion',151-5*i,180);
    img(i)= deconvwnr(f, PSF, 0.05);
    img=[img,img(i)];
end
dstImage=[img,img1];
figure
imshow(dstImage);
%imwrite(dstImage,'85,0.1.jpg');
