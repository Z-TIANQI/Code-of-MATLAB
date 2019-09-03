clc;clear
x=load('1.txt'); 
%统计量的P值<0.05，拒绝序列为纯随机序列的原假设,认为各序列值之间有相关关系。
[h,pvalue]=lbqtest(x)  %p-value 检验统计量的p值
