clear;clc;
x=load('1.txt');
x=x';
for i=0:3
    for j=0:3
        if i==0 && j==0
            continue    %ģ���е�p,q����ͬʱΪ0
        end
        m=armax(x,[i,j]); %���ģ�ͣ���֪���ݱ�����������
        myaic=aic(m); %����AICָ��
        fprintf('p=%d,q=%d,AIC=%f\n',i,j,myaic); %��ʾ������
    end
end
%%ͨ��ö�ٷ�����AIC׼���ģ�Ͷ��ף�ѡȡAICֵ��С��p,q��Ϊģ�͵Ľ�����
%%�������ģ�⣬ÿһ�����еĽ�����ǲ�һ����
p=input('�������p=');%����ģ�͵Ĳ���
q=input('�������q='); 
m=armax(x,[p,q]); %���ָ������p,q��ģ��
% [e,r]=resid(m,x); %����в�����
% xp=predict(m,x,5);%Ԥ��ֵ
% h=lbqtest(r) %����chi2���飬h=0��ʾû���㹻��֤��֤������裬���в��ǲ���ص�
% yhat=forecast(m,5,x');

ToEstVarMd=garch(p,q);
ToEstMd=arima('ARLags',3,'MALags',2,'Constant',0,'Variance',ToEstVarMd);
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,x);%ģ�����
res=infer(EstMd,x);%����в�
[h,pvalue]=lbqtest(res);%����ģ�ͼ���
xp=predict(m,x,5);
yhat=forecast(EstMd,5,'Y0',x);


