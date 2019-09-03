
%直方图均衡化代码

% 输入文件： PicSample.jpg 待处理图像
% figure1 待处理彩色图像
% figure2 灰度化后图像
% figure3 直方图
% figure4 均衡化后直方图
% figure5 均衡化后图像

% 一，图像的预处理，读入彩色图像其灰度化
%PS=imread('img1'); % 读入 JPG 图片
%imshow(PS) % 显示出来 figure1
PS=img1;
title(' 输入的彩色 JPG 图像 ');
PS=rgb2gray(PS); % 将图片转为灰度图
%figure
%imshow(PS) ;% 显示灰度化后的图像，也是均衡化前的样品figure2
title(' 灰度化后的图像 ');


% 二，绘制直方图
[m,n]=size(PS); % 测量图像尺寸参数
GP=zeros(1,256); % 预创建存放灰度出现概率的向量
for k=0:255
    GP(k+1)=length(find(PS==k))/(m*n); % 计算每级灰度出现的概率。
end
%figure
bar(0:255,GP ,'g') % 绘制直方图 figure3
%title('原图像直方图')
xlabel('灰度值')
ylabel('出现概率')

% 三，直方图均衡化
S1=zeros(1,256);
for i=1:256
    for j=1:i
        S1(i)=GP(j)+S1(i); %计算原图像中某一灰度值以下所有灰度级出现的概率和。
    end
    S2=round(S1*256);%归到相近的灰度级
end
for i=1:256 
    a=find(S2==i);
    GPeq(i)=sum(GP(a)); % 计算现有每个灰度级出现的概率
end
%figure
bar(0:255,GPeq,'b') % 显示均衡化后的直方图 figure4
title(' 均衡化后的直方图 ')
xlabel(' 灰度值 ')
ylabel(' 出现概率 ')

% 四，图像均衡化
PA=PS;
for i=0:255 
    p=find(PS==i);
    PA(p)=S2(i+1); % 将各个像素归一化后的灰度值赋给这个像素
end
figure;
imshow(PA) % 显示均衡化后的图像 figure5
title(' 均衡化后图像 ')
%BW_sobel = edge(PA,'canny',0.05);
%imshow(BW_sobel);
