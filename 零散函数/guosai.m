clear;clc;
move_time=[20,33,46];%�ƶ�i����λ�����ʱ��
CNC_distance=[0,0,move_time(1),move_time(1),move_time(2),move_time(2),move_time(3),move_time(3)
              0,0,move_time(1),move_time(1),move_time(2),move_time(2),move_time(3),move_time(3)
              move_time(1),move_time(1),0,0,move_time(1),move_time(1),move_time(2),move_time(2)
              move_time(1),move_time(1),0,0,move_time(1),move_time(1),move_time(2),move_time(2)
              move_time(2),move_time(2),move_time(1),move_time(1),0,0,move_time(1),move_time(1)
              move_time(2),move_time(2),move_time(1),move_time(1),0,0,move_time(1),move_time(1)
              move_time(3),move_time(3),move_time(2),move_time(2),move_time(1),move_time(1),0,0
              move_time(3),move_time(3),move_time(2),move_time(2),move_time(1),move_time(1),0,0];%�������
Clear_time=25;%��ϴʱ��
Up_and_Down_material_time=[28,31];%������ʱ��
CNC_process_time=560;
for i=1:8
    for j=1:8
        if mod(j,2)==0
        u(i,j)=CNC_distance(i,j)+Clear_time+Up_and_Down_material_time(2);
        else
        u(i,j)=CNC_distance(i,j)+Clear_time+Up_and_Down_material_time(1);
        end
    end
end
CNC_state=zeros(8,8);%CNC״̬����,��ֵΪ���ʱ��
a=zeros(1,8);
temp=a;
for i=1:8
    a(i)=u(1,i)+waiting_time(a(i),CNC_state(i));%���߱���
    CNC_state(i,i)=a(i)+CNC_process_time-Clear_time;
end
k=1;%���ձ�����CNC����
R=zeros(8,400);
for i=1:8
    R(i,1)=i;
end
while min(a)<8*3600
for i=1:8
   for j=1:8
        temp(j)=u(i,j)+waiting_time(a(i),CNC_state(i,j));%���߱���
   end  
   mintemp=min(temp);
    a(i)=a(i)+mintemp; 
    [x,min_location]=find(temp==mintemp);
    %
    R(i,k+1)=min_location;
    CNC_state(i,min_location)=a(i)+CNC_process_time-Clear_time;
end
k=k+1;
end
