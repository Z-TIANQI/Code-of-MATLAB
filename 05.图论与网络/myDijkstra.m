function [md,mp]=myDijkstra(a,s,z)
% 输入：a是邻接矩阵A(i,j)，可以是有向的。
% s是起点标号，z是终点标号
% 输出：md是最短路距离，mp是最短路径

n=size(a,1);%A的行数
visited(1:n)=0;%0为未标号，1为标号
d(1:n)=inf;%起始点到各点的距离为inf。
d(s)=0;%起始点到本身的距离为0。
pa(1:n)=0;%
for i=1:n-1
    juli=d;
    index1=find(visited==1);%查找已标号的点。
    juli(index1)=inf;%已标号点的距离换成无穷。
    [x,y]=min(juli);%找距离起始点最近的顶点，x为最小值，y为第y个顶点。
    visited(y)=1;%标记已经标号的顶点。
    index2=find(visited==0);%查找未标号的顶点。
    for v=index2
        if a(y,v)+d(y)<d(v)
            d(v)=d(y)+a(y,v);
            pa(v)=y;
        end
    end
end
md=d(z);
%从终点到起点求最短路径
mp=[];
if pa(z)~=0;%如果存在路连接终点
    t=z;
    mp=[z];
    while x~=s
        p=pa(t);
        mp=[p,mp];
        t=p;
    end
end
return