function w=waiting_time(process_time,state)
%在当前时刻，到达CNC后需等待的时间
if state==0
    w=0;
else
    w=state-process_time;
end
end
