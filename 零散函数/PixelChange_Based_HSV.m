clear 
clc
image=imread( 'H:\╨зялЁ╣╪Л╡Б\╨зялм╪ф╛\╨зялм╪ф╛\льйБЁ║╬╟\дЮма\21.jpg' );
[h,s,v]=rgb2hsv(image);
s1=floor(255*s)+1;
[x,y,z]=size(image);
for i=1:x
    for j=1:y
        if s1(i,j)<=15
            image(i,j,1)=255;
            image(i,j,2)=255;
            image(i,j,3)=255;
        end
    end
end
imshow(image);