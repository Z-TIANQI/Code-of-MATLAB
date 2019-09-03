    clc;clear;
    x0=[1 8.55 470 300 10
        2 3.79 285 80 10
        3 4.82 470 300 120
        4 0.02 470 80 120
        5 2.75 470 80 10
        6 14.39 100 190 10
        7 2.54 100 80 65
        8 4.35 470 190 65
        9 13 100 300 54
        10 8.5 100 300 120
        11 0.05 100 80 120
        12 11.32 285 300 10
        13 3.13 285 190 120];
    x=x0(:,3:5);
    y=x0(:,2);
    beta=[1 1 1 1 1];%回归系数的初值，任意给
    [betahat,r,j]=nlinfit(x,y,@(beta,x)(beta(4)*x(:,2)-x(:,3)/beta(5))./(1+beta(1)*x(:,1)+beta(2)*x(:,2)+beta(3)*x(:,3)),beta);
    betaci=nlparci(betahat,r,'jacobian',j);
    betaa=[betahat',betaci];%回归系数与置信区间。
    [yhat,delta]=nlpredci(@(beta,x)(beta(4)*x(:,2)-x(:,3)/beta(5))./(1+beta(1)*x(:,1)+beta(2)*x(:,2)+beta(3)*x(:,3)),x,betahat,r,'jacobian',j);
    %y的预测值与其置信区间半径.