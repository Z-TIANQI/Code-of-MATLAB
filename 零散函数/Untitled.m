%1-8遍历的顺序
clc;clear;
first=1;
second=2;
third=3;
fourth=4;
fifth=5;
sixth=6;
seventh=7;
eighth=8;
global move_time;
global process_time;
global CNC_state;
global file_number1;
global file_number2;
file_number1=2;
file_number2=2;
CNC_state=[inf,inf,inf,inf,inf,inf,inf,inf];%八个CNC的工作时间
move_time=[23,41,59];%移动i个单位所需的时间
total_times=0;%轮次计数器
fprintf('开始仿真，RGV位于CNC1和CNC2中间处\n');
%首先移动到第一个位置点
d=distance(first,1);
if d==0
    process_time=0;
else
    process_time=move_time(d);
end
while process_time<8*3600
state_transfer(first,second);
checkCNC(second);
state_transfer(second,third);
checkCNC(third);
state_transfer(third,fourth);
checkCNC(fourth);
state_transfer(fourth,fifth);
checkCNC(fifth);
state_transfer(fifth,sixth);
checkCNC(sixth);
state_transfer(sixth,seventh);
checkCNC(seventh);
state_transfer(seventh,eighth);
checkCNC(eighth);
state_transfer(eighth,first);
checkCNC(first);
total_times=total_times+1;
end
fprintf('在8个小时内共遍历了%d次\n',total_times-1);
