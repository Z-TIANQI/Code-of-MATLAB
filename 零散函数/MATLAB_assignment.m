
%ֱ��ͼ���⻯����

% �����ļ��� PicSample.jpg ������ͼ��
% figure1 �������ɫͼ��
% figure2 �ҶȻ���ͼ��
% figure3 ֱ��ͼ
% figure4 ���⻯��ֱ��ͼ
% figure5 ���⻯��ͼ��

% һ��ͼ���Ԥ���������ɫͼ����ҶȻ�
%PS=imread('img1'); % ���� JPG ͼƬ
%imshow(PS) % ��ʾ���� figure1
PS=img1;
title(' ����Ĳ�ɫ JPG ͼ�� ');
PS=rgb2gray(PS); % ��ͼƬתΪ�Ҷ�ͼ
%figure
%imshow(PS) ;% ��ʾ�ҶȻ����ͼ��Ҳ�Ǿ��⻯ǰ����Ʒfigure2
title(' �ҶȻ����ͼ�� ');


% ��������ֱ��ͼ
[m,n]=size(PS); % ����ͼ��ߴ����
GP=zeros(1,256); % Ԥ������ŻҶȳ��ָ��ʵ�����
for k=0:255
    GP(k+1)=length(find(PS==k))/(m*n); % ����ÿ���Ҷȳ��ֵĸ��ʡ�
end
%figure
bar(0:255,GP ,'g') % ����ֱ��ͼ figure3
%title('ԭͼ��ֱ��ͼ')
xlabel('�Ҷ�ֵ')
ylabel('���ָ���')

% ����ֱ��ͼ���⻯
S1=zeros(1,256);
for i=1:256
    for j=1:i
        S1(i)=GP(j)+S1(i); %����ԭͼ����ĳһ�Ҷ�ֵ�������лҶȼ����ֵĸ��ʺ͡�
    end
    S2=round(S1*256);%�鵽����ĻҶȼ�
end
for i=1:256 
    a=find(S2==i);
    GPeq(i)=sum(GP(a)); % ��������ÿ���Ҷȼ����ֵĸ���
end
%figure
bar(0:255,GPeq,'b') % ��ʾ���⻯���ֱ��ͼ figure4
title(' ���⻯���ֱ��ͼ ')
xlabel(' �Ҷ�ֵ ')
ylabel(' ���ָ��� ')

% �ģ�ͼ����⻯
PA=PS;
for i=0:255 
    p=find(PS==i);
    PA(p)=S2(i+1); % ���������ع�һ����ĻҶ�ֵ�����������
end
figure;
imshow(PA) % ��ʾ���⻯���ͼ�� figure5
title(' ���⻯��ͼ�� ')
%BW_sobel = edge(PA,'canny',0.05);
%imshow(BW_sobel);
