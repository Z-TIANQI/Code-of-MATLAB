e=imread('C:\Users\87689\Desktop\2018������ս������\B1\ͼ1.png');
[row,col]=size(e);
for i=2:2:row
    for j=1:col
        e(i/2,j)=(e(i,j)+e(i-1,j))/2;
    end
end
img=imcrop(e,[0,0,col,row/2]);
imshow(img)