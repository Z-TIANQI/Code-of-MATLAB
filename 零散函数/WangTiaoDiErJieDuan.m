close all;
clear;
clc;

TargetImg   = imread('C:\Users\87689\Desktop\2018认证杯网络挑战赛第二阶段赛题\B2\图2.jpg');  
SourceImg   = imread('C:\Users\87689\Desktop\2018认证杯网络挑战赛第二阶段赛题\B2\prosessed.jpg');  
SourceMask  = im2bw(imread('C:\Users\87689\Desktop\2018认证杯网络挑战赛第二阶段赛题\B2\mask.jpg'));

TargBoundry = bwboundaries(SourceMask, 8);
figure, imshow(TargetImg), axis image
hold on
for k = 1:length(TargBoundry)  
    boundary = TargBoundry{k};  
    plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 1)  
end
title('Target Image with intended place for pasting Source'); 

templt = [0 -1 0; -1 4 -1; 0 -1 0];  
LaplacianSource = imfilter(double(SourceImg), templt, 'replicate');  
VR = LaplacianSource(:, :, 1);  
VG = LaplacianSource(:, :, 2);  
VB = LaplacianSource(:, :, 3); 

TargetImgR = double(TargetImg(:, :, 1));  
TargetImgG = double(TargetImg(:, :, 2));  
TargetImgB = double(TargetImg(:, :, 3));  

TargetImgR(logical(SourceMask(:))) = VR(SourceMask(:));  
TargetImgG(logical(SourceMask(:))) = VG(SourceMask(:));  
TargetImgB(logical(SourceMask(:))) = VB(SourceMask(:));  

TargetImgNew = cat(3, TargetImgR, TargetImgG, TargetImgB);  
figure, imagesc(uint8(TargetImgNew)), axis image, title('Target image with laplacian of source inserted'); 

% AdjacencyMat = calcAdjancency( SourceMask ); 
% ResultImgR = guaseidel(TargetImgR, SourceMask, AdjacencyMat, TargBoundry);  
% ResultImgG = guaseidel(TargetImgG, SourceMask, AdjacencyMat, TargBoundry);  
% ResultImgB = guaseidel(TargetImgB, SourceMask, AdjacencyMat, TargBoundry); 
% ResultImg = cat(3, ResultImgR, ResultImgG, ResultImgB);  
% 
% figure;  
% imshow(uint8(ResultImg)); 



