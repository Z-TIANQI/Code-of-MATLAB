clear,clc;
D=load('ģ��������.txt');
Y=zeros(58,96);%�任���©ˮ��
B=zeros(58,96);%�任ǰ�Ĺ�ˮ��
for i=1:96:5474
    B((i-1)/96+1,:)=D(i:i+95);
    if (i-1)/96+1<16
        B((i-1)/96+1,4:21)=B((i-1)/96+1,4:21)-10;
    end
    fs=1000;N=96;    %����Ƶ�ʺ����ݵ���
    n=0:N-1;    %ʱ������
    y=fft(B((i-1)/96+1,:),N);     %���źŽ��п���Fourier�任
    mag=abs(y);      %���Fourier�任������
    f=n*fs/N;     %Ƶ������
    plot(f,mag);    %�����Ƶ�ʱ仯�����
    xlabel('Ƶ��/Hz');
    ylabel('���');title('N=96');grid on;
    x=find(abs(mag)<50);
    y(x)=0;
    Y((i-1)/96+1,:)=ifft(y);
end
Y=mean(Y);
% T=1:96;
% plot(T,Y);

% %������
% JieGuo=[];
% T=1:96;
% wucha=zeros(58,96);
% for i=1:58
%     %����
%     [paixu1,index1]=sort(B(i,:));
%     [paixu2,index2]=sort(Y);
%     xuhao1=[T;index1];
%     xuhao2=[T;index2];
%     %�����
%     wucha(i,:)=10000*(B(i,:)./sum(B(i,:))-Y./sum(Y));
%     %��ȼ���
%     for j=1:96
%         xuhao3(j)=xuhao1(1,find(xuhao1(2,:)==j));
%         xuhao4(j)=xuhao2(1,find(xuhao2(2,:)==j));
%     end
%     %���쳣��
%     for k=1:96
%         if abs(xuhao3(k)-xuhao4(k))>7 && abs(B(i,k)-Y(k))>7 && ((k>4 && k<25) || (k>55 && k<65) || k>90) && (wucha(i,k)>19 || wucha(i,k)<-30)
%             JieGuo=[JieGuo,k];
%         end
%     end
%     %����쳣��
%     hold on;
%     if (~isempty(JieGuo))
%         figure(i);
%         plot(T,B(i,:),T,Y);
%         text(JieGuo,B(i,JieGuo),'o','color','r');
%     end
%     JieGuo=[];
% end




T=1:96;
for i=1:58
    figure
    plot(T,B(i,:));
    hold on;
    plot(T,Y);
end

% D=[D',Y(90:end)];

% %�ҳ�ˮ���쳣����
% for i=1:96:5570
%     B=D(i:i+95);
%     for k=1:4:93
%         junzhi1((k-1)/4+1)=mean(B(k:k+3));
%         junzhi((k-1)/4+1)=mean(Y(k:k+3));
%     end
%     wucha=junzhi1-junzhi;
%     chafen1=diff(wucha);
%     chafen2=diff(chafen1);
%     if min(chafen2)<-10
%         n=find(min(chafen2));
%         sprintf('%d','%d',(i-1)/96+1,n+1);
%     end
% end
%     
    
% 
% FuZhi=mag(x);
% XiangWei=ph(x);
% hold on;
% t=1:96;
% [hang,lie]=size(x);
% F=zeros(hang,96);
% for i=1:hang
%     plot(FuZhi(i)*sin(fs*(t+XiangWei(i))));
%     F(i,:)=FuZhi(i)*sin(fs*(t+XiangWei(i)));
% end
% 
% DieJia=zeros(1,96);
% for i=1:hang
%     DieJia=DieJia+F(i,:);
% end
% figure
% plot(DieJia)