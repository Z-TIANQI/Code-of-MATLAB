clear;clc;
data=load('1.txt');
%ͳ������Pֵ<0.05���ܾ�����Ϊ��������е�ԭ����,��Ϊ������ֵ֮������ع�ϵ��
[h,pvalue]=lbqtest(data)  %p-value ����ͳ������pֵ
