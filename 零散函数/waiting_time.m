function w=waiting_time(process_time,state)
%�ڵ�ǰʱ�̣�����CNC����ȴ���ʱ��
if state==0
    w=0;
else
    w=state-process_time;
end
end
