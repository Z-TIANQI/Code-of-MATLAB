function [g,h]=fun2(x)
%数学建模算法大全--第三章--非线性规划Matlab实现--非线性约束条件
g=[-x(1)^2+x(2)^2-x(3)^2
    x(1)^2+x(2)^2+x(3)^2-20];
h=[-x(1)-x(2)^2+2
    x(2)+2*x(3)^2-3];