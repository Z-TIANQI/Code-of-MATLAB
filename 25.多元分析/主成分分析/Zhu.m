clear;clc;
data=load ('data.txt');      %��ԭ���ݱ����ڴ��ı��ļ�data.txt��
data=zscore(data); %���ݱ�׼��
r=corrcoef(data);  %�������ϵ������
%�����������ϵ������������ɷ�����x����Ϊr�����������������ɷֵ�ϵ��
[x,y,z]=pcacov(r)   %ȡXǰ����Ϊ���ɷ֣�yΪr������ֵ��zΪ�������ɷֵĹ�����
f=repmat(sign(sum(x)),size(x,1),1);%������xͬά����Ԫ��Ϊ����1�ľ���
x=x.*f;
num=5;%numΪѡȡ���ɷֵĸ���
df=data*x(:,1:num);%����������ɷֵĵ÷�
tf=df*z(1:num)/100 %�����ۺϵ÷�
[stf,ind]=sort(tf,'descend'); %�ѵ÷ְ��մӸߵ��׵Ĵ�������
stf=stf',ind=ind'
