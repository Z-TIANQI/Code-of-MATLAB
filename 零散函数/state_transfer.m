%״̬ת�ƺ���
function state_transfer(primary_state,present_state)
global process_time;
global move_time;
global CNC_state;
global file_number1;
CNC_time=545;%CNC�ӹ����һ��һ���������������ʱ��
RGV_CNC=[27,32];%RGVΪ������ż��һ������������ʱ��
Clear_time=25;%RGV���һ�����ϵ���ϴ��ҵ����ʱ��
fprintf('%d�뿪ʼΪCNC%d���ϡ���\n',process_time,primary_state);
string=strcat('A',num2str(file_number1),':C',num2str(file_number1));
xlswrite('Case_3_result_1.xls',[file_number1-1 primary_state  process_time],3,string);
file_number1=file_number1+1;
if mod(primary_state,2)==0
    process_time=process_time+RGV_CNC(2);
    fprintf('������ɣ�%d�뿪ʼ��ϴ����\n',process_time);
else
    process_time=process_time+RGV_CNC(1);
    fprintf('������ɣ�%d�뿪ʼ��ϴ����\n',process_time);
end
CNC_state(primary_state)=process_time+CNC_time;
process_time=process_time+Clear_time;
fprintf('��ϴ��ɣ�%d�뿪ʼ�ƶ���CNC%d����\n',process_time,present_state);
d=distance(primary_state,present_state);
if d==0
    process_time=process_time+0;
else
    process_time=process_time+move_time(d);
end
end
