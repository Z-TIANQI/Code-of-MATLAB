clear,clc;
D=load('ģ��������.txt');
S=load('ģ��������ˮѹ.txt');
C=zeros(58,13);%ˮѹ
B=zeros(58,13);%�任ǰ�Ĺ�ˮ��
for i=1:96:5474
    B((i-1)/96+1,:)=D(i+8:i+20);
    C((i-1)/96+1,:)=S(i+8:i+20);
end
B=B';
C=C';
B=mean(B);
C=mean(C);
T=1:58;
hold on;
plot(T,C);
plot(T,B);
B(44)=20;
B=B';
mean(B(1:15));
% E=B./C;
% % plot(T,E);
% plot(C,B,'.');