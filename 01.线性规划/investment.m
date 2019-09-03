a=0;
hold on
while (a<0.05)
    C=[-0.05,-0.27,-0.19,-0.185,-0.185];
    A=[zeros(4,1),diag([0.025,0.015,0.005,0.026])];
    b=a*ones(4,1);
    Aeq=[1,1.01,1.02,1.045,1.065];
    beq=1;
    LB=zeros(5,1);
    [x,Q]=linprog(C,A,b,Aeq,beq,LB);
    Q=-Q;
    plot(a,Q,'*r');
    a=a+0.001;
end