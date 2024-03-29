function old=yuweiold(base)
 %旧税率下的个税
 % old新税率后的个税，
 % base所得税基数
 base=[5100,5689,6038,6529,7109,7449,7981,8429,8834,9241];

t=base-3500;
old=zeros(1,10);

for i=1:length(t)
    if  t(i)<=0
        old(i)=t(i)*0;
    elseif t(i)<=1500
        old(i)=t(i)*0.03;
    elseif t(i)<=4500
        old(i)=1500*0.03+(t(i)-1500)*0.1;
    elseif t(i)<=9000
        old(i)=1500*0.03+(4500-1500)*0.1+(t(i)-4500)*0.2;
    elseif t(i)<=35000
         old(i)=1500*0.03+(4500-1500)*0.1+(9000-4500)*0.2+(t(i)-9000)*0.25;
    elseif t(i)<=55000
        old(i)=1500*0.03+(4500-1500)*0.1+(9000-4500)*0.2+(35000-9000)*0.25+(t(i)-35000)*0.30;
    elseif t(i)<=80000
        old(i)=1500*0.03+(4500-1500)*0.1+(9000-4500)*0.2+(35000-9000)*0.25+(55000-35000)*0.30+(t(i)-55000)*0.35;
    else
        old(i)=1500*0.03+(4500-1500)*0.1+(9000-4500)*0.2+(35000-9000)*0.25+(55000-35000)*0.30+(80000-55000)*0.35+(t(i)-80000)*0.45;
    end    
end  