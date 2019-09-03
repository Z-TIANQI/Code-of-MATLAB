function i=tixingfaqiujifen(f,a,b,n)
%梯形法求积分
if nargin<4
    n=100;
end
h=(b-a)/n;
x=a:h:b;
fx=f(x);
s=(fx(1)+fx(end))/2+sum(fx(2:end-1));
i=s*h;
return