%Ϊ����߼��㾫�ȣ������ڵ���ʱ���ñ䲽��������
clc,clear
x=[2;2];
[f0,g1,g2]=nwfun(x);
while norm(g1)>0.000001
    p=-inv(g2)*g1;
    p=p/norm(p);
    t=1;
    f=nwfun(x+t*p);
    while f>f0
        t=t/2;
        f=nwfun(x+t*p);
    end
    x=x+t*p;
    [f0,g1,g2]=nwfun(x);
end
