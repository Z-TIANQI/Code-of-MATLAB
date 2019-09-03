clc,clear;
fid=fopen('txt1.txt','r');%导入数据
n1=6;n2=3;
a=[];
for i=1:n1
    tline=fgetl(fid);
    tmp=str2num(tline);%从文件中读取一行数据，并去掉换行符
    a=[a;tmp];%读准则层判断矩阵
end

for i=1:n1
    str1=char(['b',int2str(i),'=[];']);
    str2=char(['b',int2str(i),'=[b',int2str(i),';tmp];']);
    eval(str1);%将字符串转化为可执行语句
    for j=1:n2
        tmp=str2num(fgetl(fid));
        eval(str2);%读方案层的判断矩阵
    end
end

ri=[0,0,0.58,0.90,1.12,1.24,1.32,1.41,1.45];%一致性指标
[x,y]=eig(a);%取A的全部特征值构成对角阵Y，x:求A全部特征值所对应的特征向量
lamda=max(diag(y));%找出最大特征值
num=find(diag(y)==lamda);%找出最大特征值所对应特征向量的所在列数
w0=x(:,num)/sum(x(:,num));%归一化最大特征值所对应的特征向量
cr0=(lamda-n1)/(n1-1)/ri(n1);%一致性检验
for i=1:n1
    [x,y]=eig(eval(char(['b',int2str(i)])));
    lamda=max(diag(y));
    num=find(diag(y)==lamda);
    w1(:,i)=x(:,num)/sum(x(:,num));
    cr1(i)=(lamda-n2)/(n2-1)/ri(n2);
end
w0%准则层权值
w1%方案层单排序权值
cr1;
ts=w1*w0%总排序权值
cr=cr1*w0%一致性检验



