function [md,mp]=myDijkstra(a,s,z)
% ���룺a���ڽӾ���A(i,j)������������ġ�
% s������ţ�z���յ���
% �����md�����·���룬mp�����·��

n=size(a,1);%A������
visited(1:n)=0;%0Ϊδ��ţ�1Ϊ���
d(1:n)=inf;%��ʼ�㵽����ľ���Ϊinf��
d(s)=0;%��ʼ�㵽����ľ���Ϊ0��
pa(1:n)=0;%
for i=1:n-1
    juli=d;
    index1=find(visited==1);%�����ѱ�ŵĵ㡣
    juli(index1)=inf;%�ѱ�ŵ�ľ��뻻�����
    [x,y]=min(juli);%�Ҿ�����ʼ������Ķ��㣬xΪ��Сֵ��yΪ��y�����㡣
    visited(y)=1;%����Ѿ���ŵĶ��㡣
    index2=find(visited==0);%����δ��ŵĶ��㡣
    for v=index2
        if a(y,v)+d(y)<d(v)
            d(v)=d(y)+a(y,v);
            pa(v)=y;
        end
    end
end
md=d(z);
%���յ㵽��������·��
mp=[];
if pa(z)~=0;%�������·�����յ�
    t=z;
    mp=[z];
    while x~=s
        p=pa(t);
        mp=[p,mp];
        t=p;
    end
end
return