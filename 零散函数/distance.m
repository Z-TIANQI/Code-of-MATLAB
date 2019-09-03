%求两个CNC的距离（d1，d2为序号）
function d=distance(d1,d2)
if d1==1 || d1==2
    if d2==2 || d2==1
        d=0;
    elseif d2==3 || d2==4
        d=1;
    elseif d2==5 || d2==6
        d=2;
    elseif d2==7 || d2==8
        d=3;
    end
elseif d1==3 ||d1==4
    if d2==2 || d2==1
        d=1;
    elseif d2==3 || d2==4
        d=0;
    elseif d2==5 || d2==6
        d=1;
    elseif d2==7 || d2==8
        d=2;
    end
elseif d1==5 || d1==6
    if d2==2 || d2==1
        d=2;
    elseif d2==3 || d2==4
        d=1;
    elseif d2==5 || d2==6
        d=0;
    elseif d2==7 || d2==8
        d=1;
    end
elseif d1==7 || d1==8
    if d2==2 || d2==1
        d=3;
    elseif d2==3 || d2==4
        d=2;
    elseif d2==5 || d2==6
        d=1;
    elseif d2==7 || d2==8
        d=0;
    end
end
end
