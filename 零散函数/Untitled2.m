GH=tf(200,[1 20 0]);
sys=feedback(GH,1);
z=tzero(sys)';
p=pole(sys)';
ii=find(real(p)>0);
n1=length(ii);
ij=find(real(z)>0);
n2=length(ij);
if(n1>0)
    disp('系统不稳定');
else
    disp('系统稳定！');
end
if(n2>0)
    disp('系统不是最小相位系统');
end
margin(GH);
[Gm,Pm,Wcg,Wcp]=margin(GH);
PGm=num2str(20*log10(Gm));
PPm=num2str(Pm);
Gms=char('系统的幅值裕量为',PGm);
Pms=char('系统的相位裕量为',PPm);
disp(Gms);
disp(Pms);
