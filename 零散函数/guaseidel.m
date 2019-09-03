function [x,n] = guaseidel(A,b,x0,eps,M)
if nargin == 3
    eps = 1.0e-6;
    M= 200;
elseif nargin == 4
    M = 200;
elseif nargin <3
    disp('输入参数个数不足3个');
    return;
end
D = diag(diag(A));%求A的对角矩阵
L = -tril(A,-1);%求A的下三角矩阵,不带对角线
U = -triu(A,1);%求A的上三角矩阵
G = (D-L)\U;
f = (D-L)\b;
x = G*x0+f;
n=1;  %迭代次数
while norm(x-x0)>=eps
    x0 = x;
    x = G*x0+f;
    n = n+1;
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛');
        return;
    end
end