clear
clc
t=1;
ObjDir='D:\人工智能\py代码\data\test\';%目标图片文件夹路径
OutputDir='D:\人工智能\py代码\data\test\';%输出文件夹路径
while(1)
    bgFile=[ObjDir,'test (',int2str(t),').jpg'];
    x=imread(bgFile);
%     if isempty(x)
%         break;
%     end
%     [h,s,v]=rgb2hsv(x);
%     s1=floor(255*h)+1;
%     a=zeros(1,256);
%     [d1,d2,d3]=size(x);
%     for i=1:3*floor(d1/4)
%         for j=floor(d2/3):2*floor(d2/3)
%             for k=1:256
%                 if s1(i,j)==k
%                     a(k)=a(k)+1;
%                 end
%             end
%         end
%     end
    figure(t);
%     bar(a);
    imshow(x);
    saveas(t,[OutputDir,int2str(t),'.jpg']);
    t=t+1;
end

