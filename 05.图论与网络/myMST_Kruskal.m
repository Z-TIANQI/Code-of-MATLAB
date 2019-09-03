function R=myMST_Kruskal(a)
[x,y,e]=find(a);
data=[x';y';e'];
index=data(1:2,:);
R=[];
while length(R)<size(a)-1
    t=min(data(3,:));
    f=find(data(3,:)==t);
    f=f(1);
    v1=index(1,f);
    v2=index(2,f);
    if v1~=v2
        R=[R,data(:,f)];
    end
    index(index==v2)=v1;
    data(:,f)=[];
    index(:,f)=[];
end


