% clc;clear;
% 
% randn('state',sum(clock));
% elps=randn(1,10000);
% x(1)=0;
% for j=2:10000
%     x(j)=0.8*x(j-1)+elps(j)-0.4*elps(j-1);
% end
x=load('1.txt');
x=x';
for i=0:3
    for j=0:3
        if i==0&j==0
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
% m=armax(x,[p,q]); %���ָ������p,q��ģ��
% [e,r]=resid(m,x); %����в�����
% h=lbqtest(r) %����chi2���飬h=0��ʾû���㹻��֤��֤������裬���в��ǲ���ص�

ToEstVarMd=garch(p,q);
%%%%���³������ˣ�Ԥ������ȫ��׼��'ARLags',1,'MALags',1������������֪������
ToEstMd=arima('ARLags',1,'MALags',1,'Constant',0,'Variance',ToEstVarMd);

[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,x)
res=infer(EstMd,x);
h=lbqtest(res);
yaht=forecast(EstMd,3,'Y0',x)
