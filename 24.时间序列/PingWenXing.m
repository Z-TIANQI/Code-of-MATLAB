clc,clear
x0=load('1.txt'); 
x0=x0'; x0=x0(:)'; n=length(x0);
[xsort,ind]=sort(x0);%����С����Ĵ�����������
Rt(ind)=1:n;%������
t=1:n;
Qs=1-6/(n*(n^2-1))*sum((t-Rt).^2); %���� Qs ��ֵ
t=Qs*sqrt(n-2)/sqrt(1-Qs^2) %���� t ͳ������ֵ
t_0=tinv(0.975,n-2) %������ alpha/2 ��λ��
