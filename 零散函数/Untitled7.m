%�����ʣ�һ������
clear;clc;
global move_time;
global CNC_state;
move_time=[18,32,46];%�ƶ�i����λ�����ʱ��
CNC_distance=[0,0,move_time(1),move_time(1),move_time(2),move_time(2),move_time(3),move_time(3)
              0,0,move_time(1),move_time(1),move_time(2),move_time(2),move_time(3),move_time(3)
              move_time(1),move_time(1),0,0,move_time(1),move_time(1),move_time(2),move_time(2)
              move_time(1),move_time(1),0,0,move_time(1),move_time(1),move_time(2),move_time(2)
              move_time(2),move_time(2),move_time(1),move_time(1),0,0,move_time(1),move_time(1)
              move_time(2),move_time(2),move_time(1),move_time(1),0,0,move_time(1),move_time(1)
              move_time(3),move_time(3),move_time(2),move_time(2),move_time(1),move_time(1),0,0
              move_time(3),move_time(3),move_time(2),move_time(2),move_time(1),move_time(1),0,0];%�������
Clear_time=25;%��ϴʱ��
Up_and_Down_material_time=[27,32];%������ʱ��
CNC_process_time=545;
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
%������Ϊ1%����������0~10��������������ʾ����������ɵ������<=0.1������Ϊ���Ϸ���
for i=1:8
    a(i)=u(1,i)+waiting_time(a(i),CNC_state(1,i),0);%���߱���
    if_debug=unifrnd(0,10);
    if if_debug<=0.1
    CNC_state(i,i)=8888;
    else
    CNC_state(i,i)=a(i)+CNC_process_time-Clear_time;
    end
end
 k=1;%���ձ�����CNC����
 for i=1:8
     R(i,1)=i;
 end
  global file_number1;
  global file_number2;
  global file_number3;
  file_number1=2;
  file_number2=2;
  file_number3=2;
  while k<400
   copy_a=a;
   for i=1:8
       for j=1:8
           if CNC_state(i,j)==8888
                CNC_state(i,j)=waiting_time(copy_a(i),CNC_state(i,j),j);
            end
            temp(j)=copy_a(i)+u(R(i,end),j)+waiting_time(copy_a(i),CNC_state(i,j),0);%���߱���
       end  
        [~,min_location]=tempfind(min(temp),temp);
        a(i)=min(temp);
        if_debug=unifrnd(0,10);
         if if_debug<=0.1
         CNC_state(i,min_location)=8888;
         else
         CNC_state(i,min_location)=a(i)+CNC_process_time-Clear_time;
         end
        R0(i,1)=min_location;
        for t=1:8
            if CNC_state(i,t)<=a(i)
                CNC_state(i,t)=0;
            end
        end
   end
   R=[R R0];
   k=k+1;
  end
 %���沢д���ļ�
 global process_time;
 process_time=CNC_distance(1,R(7,1));
 CNC_state=[inf,inf,inf,inf,inf,inf,inf,inf];
 i=1;
 while process_time<8*3600
     state_transfer(R(7,i),R(7,i+1));
     checkCNC(R(7,i+1));
     i=i+1;
 end
 fprintf('�����������');
