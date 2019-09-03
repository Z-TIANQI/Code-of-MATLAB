clear,clc;
D=load('模拟赛数据.txt');
Y=zeros(58,96);%变换后的漏水量
B=zeros(58,96);%变换前的供水量
for i=1:96:5474
    B((i-1)/96+1,:)=D(i:i+95);
    if (i-1)/96+1<16
        B((i-1)/96+1,4:21)=B((i-1)/96+1,4:21)-10;
    end
    fs=1000;N=96;    %采样频率和数据点数
    n=0:N-1;    %时间序列
    y=fft(B((i-1)/96+1,:),N);     %对信号进行快速Fourier变换
    mag=abs(y);      %求得Fourier变换后的振幅
    f=n*fs/N;     %频率序列
    plot(f,mag);    %绘出随频率变化的振幅
    xlabel('频率/Hz');
    ylabel('振幅');title('N=96');grid on;
    x=find(abs(mag)<50);
    y(x)=0;
    Y((i-1)/96+1,:)=ifft(y);
end
Y=mean(Y);
% T=1:96;
% plot(T,Y);

% %第三问
% JieGuo=[];
% T=1:96;
% wucha=zeros(58,96);
% for i=1:58
%     %排序
%     [paixu1,index1]=sort(B(i,:));
%     [paixu2,index2]=sort(Y);
%     xuhao1=[T;index1];
%     xuhao2=[T;index2];
%     %求误差
%     wucha(i,:)=10000*(B(i,:)./sum(B(i,:))-Y./sum(Y));
%     %求等级差
%     for j=1:96
%         xuhao3(j)=xuhao1(1,find(xuhao1(2,:)==j));
%         xuhao4(j)=xuhao2(1,find(xuhao2(2,:)==j));
%     end
%     %求异常点
%     for k=1:96
%         if abs(xuhao3(k)-xuhao4(k))>7 && abs(B(i,k)-Y(k))>7 && ((k>4 && k<25) || (k>55 && k<65) || k>90) && (wucha(i,k)>19 || wucha(i,k)<-30)
%             JieGuo=[JieGuo,k];
%         end
%     end
%     %标出异常点
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

% %找出水量异常升高
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