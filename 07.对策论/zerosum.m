function zerosum(R)
%R��S1����ͶԲߵ�Ӯ�þ���
%��϶Բ����lingo��δ�ἰ
sizeR=size(R);
rowR=sizeR(1,1);
colR=sizeR(1,2);
u=max(min(R'));%u����СӮ��
v=-min(max(R));%v�������ʧ
if u+v==0
    [row,col]=find(R==u);
    fprintf('���ڰ���,��Ѳ�����S1��ȡ����%d,S2��ȡ����%d\n',row,col);
else                           %S1�Էֱ��Ը���x1��x2��x3������ȡ��Ӧ����,S2�Ը���y1��y2��y3������ȡ��Ӧ����
    %m=2��n=2�跽�̽ⷽ��
    if rowR==2 && colR==2 
    [x1,x2]=solve('(R(1,1)-R(1,2))*x1+(R(2,1)-R(2,2))*x2=0','x1+x2=1','x1','x2');
    [y1,y2]=solve('(R(1,1)-R(2,1))*y1+(R(1,2)-R(2,2))*y2=0','y1+y2=1','y1','y2');
    x1=eval(x1);x2=eval(x2);y1=eval(y1);y2=eval(y2);
    E1=R(1,1)*x1+R(2,1)*x2;E2=R(1,1)*y1+R(1,2)*y2;
    fprintf('A����Ѹ�����%.2f,%.2f,����ֵ��%.3f\nB����Ѹ�����%.2f,%.2f,����ֵ��%.3f\n',x1,x2,E1,y1,y2,E2);
    %���m>2��n>2��������������Թ滮
    else
        b=10;R=R+b*ones(rowR,colR);%��Ӯ�þ����ÿ��Ԫ�ر�ɴ���0������bֻҪ�Ǹ���֤ʵ�ֵ����Ϳ���
            [x0,u]=linprog(ones(1,rowR),-R',-ones(1,rowR),[],[],zeros(1,rowR));
            x=x0/u,u=1/u-b
            [y0,v]=linprog(-ones(1,3),R,ones(3,1),[],[],zeros(3,1));
            y=y0/(-v),v=1/(-v)-b 
            if u<0
                fprintf('�ҷ�����\n');
            else
                fprintf('�׷�����\n');
            end
    end
end