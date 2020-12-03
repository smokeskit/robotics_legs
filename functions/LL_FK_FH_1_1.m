function [T0]=LL_FK_FH_1_1(x,start_point)

global link0 link1 link2 link3 link4 link5 zero_translation

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

T0=start_point*link0*cmtx1*link1*cmtx2*link2*cmtx3*link3*cmtx4*link4*cmtx5*link5*cmtx6*...
   ([rm('y',90),[-28.16 0 0]'*0.001;0 0 0 1])*([rm('z',90),zero_translation;0 0 0 1]);
end 
