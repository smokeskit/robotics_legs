function E=LL_IK_FH_1_2(x,T,start_point)

T0=LL_FK_FH_1_1(x,start_point);

p=[0 0 0 1]';
P0=T0*p;
P0(4)=[];

R0=[T0(1,1); T0(2,2); T0(3,3)];

E=T-[P0;R0];
end
