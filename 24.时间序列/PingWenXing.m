clc,clear
x0=load('1.txt'); 
x0=x0'; x0=x0(:)'; n=length(x0);
[xsort,ind]=sort(x0);%按从小到大的次序排列数据
Rt(ind)=1:n;%计算秩
t=1:n;
Qs=1-6/(n*(n^2-1))*sum((t-Rt).^2); %计算 Qs 的值
t=Qs*sqrt(n-2)/sqrt(1-Qs^2) %计算 t 统计量的值
t_0=tinv(0.975,n-2) %计算上 alpha/2 分位点
