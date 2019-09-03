clear;clc;
data=load ('data.txt');      %把原数据保存在纯文本文件data.txt中
data=zscore(data); %数据标准化
r=corrcoef(data);  %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分析，x的列为r的特征向量，即主成分的系数
[x,y,z]=pcacov(r)   %取X前三列为主成分，y为r的特征值，z为各个主成分的贡献率
f=repmat(sign(sum(x)),size(x,1),1);%构造与x同维数的元素为正负1的矩阵
x=x.*f;
num=5;%num为选取主成分的个数
df=data*x(:,1:num);%计算各个主成分的得分
tf=df*z(1:num)/100 %计算综合得分
[stf,ind]=sort(tf,'descend'); %把得分按照从高到底的次序排列
stf=stf',ind=ind'
