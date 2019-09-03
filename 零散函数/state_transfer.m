%状态转移函数
function state_transfer(primary_state,present_state)
global process_time;
global move_time;
global CNC_state;
global file_number1;
CNC_time=545;%CNC加工完成一个一道工序的物料所需时间
RGV_CNC=[27,32];%RGV为奇数、偶数一次上下料所需时间
Clear_time=25;%RGV完成一个物料的清洗作业所需时间
fprintf('%d秒开始为CNC%d上料……\n',process_time,primary_state);
string=strcat('A',num2str(file_number1),':C',num2str(file_number1));
xlswrite('Case_3_result_1.xls',[file_number1-1 primary_state  process_time],3,string);
file_number1=file_number1+1;
if mod(primary_state,2)==0
    process_time=process_time+RGV_CNC(2);
    fprintf('上料完成，%d秒开始清洗……\n',process_time);
else
    process_time=process_time+RGV_CNC(1);
    fprintf('上料完成，%d秒开始清洗……\n',process_time);
end
CNC_state(primary_state)=process_time+CNC_time;
process_time=process_time+Clear_time;
fprintf('清洗完成，%d秒开始移动到CNC%d……\n',process_time,present_state);
d=distance(primary_state,present_state);
if d==0
    process_time=process_time+0;
else
    process_time=process_time+move_time(d);
end
end
