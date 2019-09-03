clear,clc;
D=load('模拟赛数据.txt');
S=load('模拟赛数据水压.txt');
C=zeros(58,13);%水压
B=zeros(58,13);%变换前的供水量
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