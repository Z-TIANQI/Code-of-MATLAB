clear;clc;
global move_time;
global CNC_state;
move_time=[18,32,46];%移动i个单位所需的时间
CNC_distance=[0,0,move_time(1),move_time(1),move_time(2),move_time(2),move_time(3),move_time(3)
              0,0,move_time(1),move_time(1),move_time(2),move_time(2),move_time(3),move_time(3)
              move_time(1),move_time(1),0,0,move_time(1),move_time(1),move_time(2),move_time(2)
              move_time(1),move_time(1),0,0,move_time(1),move_time(1),move_time(2),move_time(2)
              move_time(2),move_time(2),move_time(1),move_time(1),0,0,move_time(1),move_time(1)
              move_time(2),move_time(2),move_time(1),move_time(1),0,0,move_time(1),move_time(1)
              move_time(3),move_time(3),move_time(2),move_time(2),move_time(1),move_time(1),0,0
              move_time(3),move_time(3),move_time(2),move_time(2),move_time(1),move_time(1),0,0];%距离矩阵
Clear_time=25;%清洗时间
Up_and_Down_material_time=[27,32];%上下料时间
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
CNC_state=zeros(8,8);%CNC状态向量,数值为完成时刻
a=zeros(1,8);
for i=1:8
    a(i)=u(1,i)+waiting_time(a(i),CNC_state(i));%决策变量
    CNC_state(i,i)=a(i)+CNC_process_time-Clear_time;
end
 k=1;%最终遍历的CNC个数
 for i=1:8
     R(i,1)=i;
 end
 global file_number1;
 global file_number2;
 file_number1=2;
 file_number2=2;
 while k<400
  copy_a=a;
  for i=1:8;
      for j=1:8
           temp(j)=copy_a(i)+u(i,j)+waiting_time(copy_a(i),CNC_state(i,j));%决策变量
      end  
       [~,min_location]=tempfind(min(temp),temp);
       a(i)=min(temp);
       file_number1=file_number1+1;
       CNC_state(i,min_location)=a(i)+CNC_process_time-Clear_time;
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
 %仿真并写入文件
 global process_time;
 process_time=0;
 CNC_state=[inf,inf,inf,inf,inf,inf,inf,inf];
 i=1;
 while process_time<8*3600
     state_transfer(R(5,i),R(5,i+1));
     checkCNC(R(5,i+1));
     i=i+1;
 end
