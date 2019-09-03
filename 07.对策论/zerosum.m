function zerosum(R)
%R是S1的零和对策的赢得矩阵
%混合对策设计lingo，未提及
sizeR=size(R);
rowR=sizeR(1,1);
colR=sizeR(1,2);
u=max(min(R'));%u是最小赢得
v=-min(max(R));%v是最大损失
if u+v==0
    [row,col]=find(R==u);
    fprintf('存在鞍点,最佳策略是S1采取策略%d,S2采取策略%d\n',row,col);
else                           %S1以分别以概率x1、x2、x3……采取对应策略,S2以概率y1、y2、y3……采取对应策略
    %m=2且n=2设方程解方程
    if rowR==2 && colR==2 
    [x1,x2]=solve('(R(1,1)-R(1,2))*x1+(R(2,1)-R(2,2))*x2=0','x1+x2=1','x1','x2');
    [y1,y2]=solve('(R(1,1)-R(2,1))*y1+(R(1,2)-R(2,2))*y2=0','y1+y2=1','y1','y2');
    x1=eval(x1);x2=eval(x2);y1=eval(y1);y2=eval(y2);
    E1=R(1,1)*x1+R(2,1)*x2;E2=R(1,1)*y1+R(1,2)*y2;
    fprintf('A方最佳概率是%.2f,%.2f,期望值是%.3f\nB方最佳概率是%.2f,%.2f,期望值是%.3f\n',x1,x2,E1,y1,y2,E2);
    %针对m>2且n>2的情况，采用线性规划
    else
        b=10;R=R+b*ones(rowR,colR);%把赢得矩阵的每个元素变成大于0的数，b只要是个保证实现的数就可以
            [x0,u]=linprog(ones(1,rowR),-R',-ones(1,rowR),[],[],zeros(1,rowR));
            x=x0/u,u=1/u-b
            [y0,v]=linprog(-ones(1,3),R,ones(3,1),[],[],zeros(3,1));
            y=y0/(-v),v=1/(-v)-b 
            if u<0
                fprintf('乙方有利\n');
            else
                fprintf('甲方有利\n');
            end
    end
end