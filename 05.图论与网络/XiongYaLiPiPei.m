clc,clear;
a=[inf,1,0,0,0;0,1,1,0,0;0,1,0,0,inf;0,0,1,0,0;0,0,inf,1,1];
%判断Z是否饱和，若不饱和选出一个不饱和点。
for x=1:length(a)
    if find(a(x,:))==inf
        continue
    else 
        break
    end
end
if x==length(x)
    fprintf('已经达到最大匹配');
end

p=x;%可增广道路的起始点
v1=x;
v2=[];
s=[];
j=1;

while 1
    %求邻点集
    for i=1:length(a)
        if find(a(v1,i)>0)
            s=[s,i];%v1的邻点集
        else
            continue
        end
    end
    if s==v2
        break%v1邻点集等于v2时，无法匹配。
    end
    
    s(s==v2)=[];%从邻点集中除去v2
    for i=1:length(s)
        if find(a(:,s(i))==inf)
            x=find(a(:,s(i))==inf);
            v1=[v1 x];
            v2=[v2 s(i)];
            p=[p i x];
        else
            if find(a(x,s(i))==0) || j==1
                continue
            elseif find(a(x,s(i))==0) || j>1
                p=[p s(i)];
                for k=1:2:length(p)-1
                    p{k}=[p(k),p(k+1)];
                end
                [xb,yb]=find(a==inf);
                for g=1:leng(xb)
                    m{g}=[xb(g),yb(g)];
                end
                m={m,p}
            end
        end
    end
    j=j+1;
end
    
[x,y]=find(a(:,y)==inf);
p=[p y x];
v1=[v1 x];
v2=[v2 y];
y=a(v1,:)>0;
if y-v2==0
    break
end
y(y==v2)=[];
for i=1:length(y)
    if a(x,y(i))==1
        break
    end
end
p=[p y(i)];



fprintf('已经达到最大匹配');
        
        




