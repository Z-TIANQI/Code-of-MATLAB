function R=myMST_Prim(a)
%输入图的邻接矩阵，不相连时为0。
%输出R为一个矩阵，第一行为起点，第二行为终点，第三行为权值。
a(a==0)=inf;
R=[];
p=1;%起始点
t=2:length(a);
while length(R)~=length(a)-1%最小生成树的边比顶点少1
    bian=a(p,t);
    bian=bian(:);
    E=min(bian);%找出最小赋权边pv长度
    [jb,kb]=find(a(p,t)==E);
    jp=p(jb(1));%最小生成树每边的起始点
    kp=t(kb(1));%最小生成树每边的终点
    R=[R,[jp;kp;E]];
    p=[p,kp];
    t(t==kp)=[];
end
