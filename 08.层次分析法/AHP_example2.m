clc,clear;
fid=fopen('txt1.txt','r');%��������
n1=6;n2=3;
a=[];
for i=1:n1
    tline=fgetl(fid);
    tmp=str2num(tline);%���ļ��ж�ȡһ�����ݣ���ȥ�����з�
    a=[a;tmp];%��׼����жϾ���
end

for i=1:n1
    str1=char(['b',int2str(i),'=[];']);
    str2=char(['b',int2str(i),'=[b',int2str(i),';tmp];']);
    eval(str1);%���ַ���ת��Ϊ��ִ�����
    for j=1:n2
        tmp=str2num(fgetl(fid));
        eval(str2);%����������жϾ���
    end
end

ri=[0,0,0.58,0.90,1.12,1.24,1.32,1.41,1.45];%һ����ָ��
[x,y]=eig(a);%ȡA��ȫ������ֵ���ɶԽ���Y��x:��Aȫ������ֵ����Ӧ����������
lamda=max(diag(y));%�ҳ��������ֵ
num=find(diag(y)==lamda);%�ҳ��������ֵ����Ӧ������������������
w0=x(:,num)/sum(x(:,num));%��һ���������ֵ����Ӧ����������
cr0=(lamda-n1)/(n1-1)/ri(n1);%һ���Լ���
for i=1:n1
    [x,y]=eig(eval(char(['b',int2str(i)])));
    lamda=max(diag(y));
    num=find(diag(y)==lamda);
    w1(:,i)=x(:,num)/sum(x(:,num));
    cr1(i)=(lamda-n2)/(n2-1)/ri(n2);
end
w0%׼���Ȩֵ
w1%�����㵥����Ȩֵ
cr1;
ts=w1*w0%������Ȩֵ
cr=cr1*w0%һ���Լ���



