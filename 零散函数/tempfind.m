function [rol,col]=tempfind(num,temp)
[m,n]=size(temp);
for i=1:m
    for j=1:n
        if num==temp(i,j)
        rol=i;
        col=j;
        break;
        end
    end
end
if i>m && j>n
    rol=0;
    col=0;
end
end
