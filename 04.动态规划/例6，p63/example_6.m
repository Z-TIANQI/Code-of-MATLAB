syms u(k)
syms x(k)
syms f(k)
f(5)=syms(5*x(5));
for k=4:1
    x(k+1)=0.9*x(k)-0.1*u(k);
    f(k)=u(k)+4*x(k)+f(k+1);
    f(k)=collect(f(k));
    if diff(f(k),u(k))>=0
        u(k)=x(k);
    else
        u(k)=0;
    end
    f(k)=collect(f(k));
end
f(1)=double(f(1));
f(1)
x(1)=double(x(1));
x(1)=1000;
x(1)
for k=2:5
    u(k)=double(u(k));
    x(k)=double(x(k));
    x(k)=0.9*x(k-1)-0.1*u(k-1);
    x(k);
end