clear,clc;
%h是吃水深度

h0=0.5;
%%求解浮标的受力方程
digits(4)
syms x y h
eq1=subs('x*cos(y/180*pi)+9800-63082.6*h',h,h0);
eq2=subs('x*sin(y/180*pi)-360+180*h',h,h0);
[X1,Y1]=solve(eq1,eq2);
M1=double(X1);
M2=double(Y1);
m1=[];
m2=[];
n1=length(M1);
for i1=1:n1
    if M1(i1)<0
        m1=[m1;i1];
    end
    if(M2(i1)>90||M2(i1)<0)
            m2=[m2;i1];    
    end
end
n1=length(m1);
for i1=1:n1
   M1(m1(i1))=[];
end
n1=length(m2);
for i1=1:n1
   M2(m2(i1))=[];
end
F1=M1;
Fy1=M2;

F=[];
Fy=[];
theta=[];

%%求解钢管受力方程,F,Fy,theta数组的4个元素，分别代表4个钢管的对应值
digits(8)
for i=1:4
  syms f1 fy1;
  eq1=subs('x*cos(y/180*pi)+98-19.7233-f1*cos(fy1/180*pi)',{f1,fy1},{F1,Fy1});
  eq2=subs('x*sin(y/180*pi)-f1*sin(fy1/180*pi)',{f1,fy1},{F1,Fy1});
  [X1,Y1]=solve(eq1,eq2);
  M1=double(X1);
  M2=double(Y1);
  m1=[];
  m2=[];
  n1=length(M1);
  for i1=1:n1
    if M1(i1)<0
        m1=[m1;i1];
    end
    if(M2(i1)>90||M2(i1)<0)
            m2=[m2;i1];    
    end
  end
  n1=length(m1);
  for i1=1:n1
    M1(m1(i1))=[];
  end
  n1=length(m2);
  for i1=1:n1
   M2(m2(i1))=[];
  end
  F=[F;M1];
  Fy=[Fy;M2];
  F2=M1;
  Fy2=M2;
  %求解第一节钢管的倾角theta
  syms f2 fy2
  eq3=subs('f1*sin((x-fy1)/180*pi)-f2*sin((fy2-x)/180*pi)',{f1,fy1,f2,fy2},{F1,Fy1,F2,Fy2});
  Z1=solve(eq3);
  M3=double(Z1);
  n1=length(M3);
  m3=[];
  for i1=1:n1
    if(M3(i1)>5||M3(i1)<0)
        m3=[m3;i1];
    end
  end
  n1=length(m3);
  for i1=1:n1
   M3(m3(i1))=[];
  end
  theta=[theta;M3];
  F1=F2;
  Fy1=Fy2;
end

%%钢桶
syms f1 fy1;
eq1=subs('x*cos(y/180*pi)+11760+980-7.100392096194632e+02-f1*cos(fy1/180*pi)',{f1,fy1},{F1,Fy1});
eq2=subs('x*sin(y/180*pi)-f1*sin(fy1/180*pi)',{f1,fy1},{F1,Fy1});
[X1,Y1]=solve(eq1,eq2);
M1=double(X1);
M2=double(Y1);
m1=[];
m2=[];
n1=length(M1);
for i1=1:n1
    if M1(i1)<0
        m1=[m1;i1];
    end
    if(M2(i1)>90||M2(i1)<0)
            m2=[m2;i1];    
    end
end
n1=length(m1);
for i1=1:n1
   M1(m1(i1))=[];
end
n1=length(m2);
for i1=1:n1
   M2(m2(i1))=[];
end
Ftong=M1;
Fytong=M2;
%求解钢桶的倾角theta
syms f2 fy2
eq3=subs('f1*sin((fy1-x)/180*pi)+f2*sin((fy2-x)/180*pi)-980*sin(x)',{f1,fy1,f2,fy2},{F1,Fy1,Ftong,Fytong});
Z1=solve(eq3);
M3=double(Z1);
n1=length(M3);
m3=[];
for i1=1:n1
    if(M3(i1)>5||M3(i1)<0)
        m3=[m3;i1];
    end
end
n1=length(m3);
for i1=1:n1
   M3(m3(i1))=[];
end
theta2=M3;

Yshen=sum(cos(theta./180.*pi));
Yshen=Yshen+cos(theta2/180*pi);

%%锚链
FF=[];
FFy=[];
ttheta=[];
F1=Ftong;
Fy1=Fytong;
for i=1:210
  syms f1 fy1;
  eq1=subs('x*cos(y/180*pi)+7.203-f1*cos(fy1/180*pi)',{f1,fy1},{F1,Fy1});
  eq2=subs('x*sin(y/180*pi)-f1*sin(fy1/180*pi)',{f1,fy1},{F1,Fy1});
  [X1,Y1]=solve(eq1,eq2);
  M1=double(X1);
  M2=double(Y1);
  m1=[];
  m2=[];
  n1=length(M1);
  for i1=1:n1
    if M1(i1)<0
        m1=[m1;i1];
    end
    if(M2(i1)>90||M2(i1)<0)
            m2=[m2;i1];    
    end
  end
  n1=length(m1);
  for i1=1:n1
    M1(m1(i1))=[];
  end
  n1=length(m2);
  for i1=1:n1
   M2(m2(i1))=[];
  end
  FF=[FF;M1];
  FFy=[FFy;M2];
  F2=M1;
  Fy2=M2;

  syms f2 fy2
  eq3=subs('f1*sin((x-fy1)/180*pi)-f2*sin((fy2-x)/180*pi)',{f1,fy1,f2,fy2},{F1,Fy1,F2,Fy2});
  Z1=solve(eq3);
  M3=double(Z1);
  n1=length(M3);
  m3=[];
  for i1=1:n1
    if(M3(i1)>5||M3(i1)<0)
        m3=[m3;i1];
    end
  end
  n1=length(m3);
  for i1=1:n1
   M3(m3(i1))=[];
  end
  ttheta=[ttheta;M3];
  F1=F2;
  Fy1=Fy2;
end