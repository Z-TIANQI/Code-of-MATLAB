clear;clc;
x=1790:10:1900;
y=[3.9,5.3,7.2,9.6,12.9,17.1,23.2,31.4,38.6,50.2,62.9,76];
z=log(y);
a=polyfit(x,z,1);
p=1790:10:1900;
q=polyval(a,p);
r=exp(q);
%plot(x,y,'r*',p,r)


x1=1:12;
a1=polyfit(x1,z,1);
k=polyval(a1,x1);
rk=exp(k);
%plot(x,y,'b*',x,rk)

s=[y-r;y-rk];
bar(x1,s')

