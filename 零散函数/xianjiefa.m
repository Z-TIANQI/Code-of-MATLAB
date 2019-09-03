function x=xianjiefa(f,x0,eps)
%µü´úÖ®ÏÒ½Ø·¨

y0=feval(f,x0);
x1=x0+0.001;
y1=feval(f,x1);

while 1
    if abs(y1-y0)<eps
        break;
    end
    x2=x1-y1/(y1-y0)*(x1-x0);
    y2=feval(f,x2);
    if abs(y2)<eps || abs(x2-x1)<eps
        x=x2;
        break;
    end
    x0=x1;
    x1=x2;
    y0=y1;
    y1=y2;
end