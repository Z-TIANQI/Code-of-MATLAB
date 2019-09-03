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
            continue    %模型中的p,q不能同时为0
        end
        m=armax(x,[i,j]); %拟合模型，已知数据必须是列向量
        myaic=aic(m); %计算AIC指标
        fprintf('p=%d,q=%d,AIC=%f\n',i,j,myaic); %显示计算结果
    end
end
%%通过枚举法利用AIC准则对模型定阶，选取AIC值最小的p,q作为模型的阶数。
%%由于随机模拟，每一次运行的结果都是不一样的
p=input('输入阶数p=');%输入模型的参数
q=input('输入阶数q='); 
% m=armax(x,[p,q]); %拟合指定参数p,q的模型
% [e,r]=resid(m,x); %计算残差向量
% h=lbqtest(r) %进行chi2检验，h=0表示没有足够的证据证明零假设，即残差是不相关的

ToEstVarMd=garch(p,q);
%%%%往下出问题了，预测结果完全不准，'ARLags',1,'MALags',1这两个参数不知道含义
ToEstMd=arima('ARLags',1,'MALags',1,'Constant',0,'Variance',ToEstVarMd);

[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,x)
res=infer(EstMd,x);
h=lbqtest(res);
yaht=forecast(EstMd,3,'Y0',x)
