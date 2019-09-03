%第三问（一道工序）
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
%故障率为1%，由生成在0~10的随机数产生概率决定，若生成的随机数<=0.1，则认为故障发生
for i=1:8
    a(i)=u(1,i)+waiting_time(a(i),CNC_state(1,i),0);%决策变量
    if_debug=unifrnd(0,10);
    if if_debug<=0.1
    CNC_state(i,i)=8888;
    else
    CNC_state(i,i)=a(i)+CNC_process_time-Clear_time;
    end
end
 k=1;%最终遍历的CNC个数
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
            temp(j)=copy_a(i)+u(R(i,end),j)+waiting_time(copy_a(i),CNC_state(i,j),0);%决策变量
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
 %仿真并写入文件
 global process_time;
 process_time=CNC_distance(1,R(7,1));
 CNC_state=[inf,inf,inf,inf,inf,inf,inf,inf];
 i=1;
 while process_time<8*3600
     state_transfer(R(7,i),R(7,i+1));
     checkCNC(R(7,i+1));
     i=i+1;
 end
 fprintf('程序结束……');
