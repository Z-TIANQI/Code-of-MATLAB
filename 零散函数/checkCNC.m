%检测CNC的状态
function checkCNC(which)
global process_time;
global CNC_state;
global file_number2;
if CNC_state(which)~=inf
    if CNC_state(which)<=process_time
        fprintf('%d时刻,CNC%d等待下料……\n',process_time,which);       
    else
        fprintf('%d时刻,等待CNC%d完成……\n',process_time,which);
        process_time=CNC_state(which);
    end
        string=strcat('D',num2str(file_number2));
        xlswrite('Case_3_result_1.xls',process_time,3,string);
        file_number2=file_number2+1;
end
end
