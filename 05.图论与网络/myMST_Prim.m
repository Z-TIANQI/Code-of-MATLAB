function R=myMST_Prim(a)
%����ͼ���ڽӾ��󣬲�����ʱΪ0��
%���RΪһ�����󣬵�һ��Ϊ��㣬�ڶ���Ϊ�յ㣬������ΪȨֵ��
a(a==0)=inf;
R=[];
p=1;%��ʼ��
t=2:length(a);
while length(R)~=length(a)-1%��С�������ı߱ȶ�����1
    bian=a(p,t);
    bian=bian(:);
    E=min(bian);%�ҳ���С��Ȩ��pv����
    [jb,kb]=find(a(p,t)==E);
    jp=p(jb(1));%��С������ÿ�ߵ���ʼ��
    kp=t(kb(1));%��С������ÿ�ߵ��յ�
    R=[R,[jp;kp;E]];
    p=[p,kp];
    t(t==kp)=[];
end
