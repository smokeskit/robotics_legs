function [T0] = RL_FK_FH_1_1(x,start_point)
global rlink0 rlink1 rlink2 rlink3 rlink4 rlink5 zero_rotation zero_translation
angle_1=x(1);
angle_2=x(2);
angle_3=x(3);
angle_4=x(4);
angle_5=x(5);
angle_6=x(6);
cmtx1=[cos(angle_1) -sin(angle_1) 0 0; sin(angle_1) cos(angle_1)  0 0; 0 0 1 0; 0 0 0 1];
cmtx2=[cos(angle_2) -sin(angle_2) 0 0; sin(angle_2) cos(angle_2)  0 0; 0 0 1 0; 0 0 0 1];
cmtx3=[cos(angle_3) -sin(angle_3) 0 0; sin(angle_3) cos(angle_3)  0 0; 0 0 1 0; 0 0 0 1];
cmtx4=[cos(angle_4) -sin(angle_4) 0 0; sin(angle_4) cos(angle_4)  0 0; 0 0 1 0; 0 0 0 1];
cmtx5=[cos(angle_5) -sin(angle_5) 0 0; sin(angle_5) cos(angle_5)  0 0; 0 0 1 0; 0 0 0 1];
cmtx6=[cos(angle_6) -sin(angle_6) 0 0; sin(angle_6) cos(angle_6)  0 0; 0 0 1 0; 0 0 0 1];

T0=start_point*rlink0*cmtx1*rlink1*cmtx2*rlink2*cmtx3*rlink3*cmtx4*rlink4*cmtx5*rlink5*cmtx6*[zero_rotation,[0 28.16 0]'*0.001;0 0 0 1]*[rm('x',90),zero_translation;0 0 0 1];
end

