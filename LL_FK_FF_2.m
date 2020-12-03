function [T0]=LL_FK_FF_2(x)
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

T0=([rm('z',90),zero_translation;0 0 0 1])^-1*([rm('y',90),[-28.16 0 0]'*0.001;0 0 0 1])^-1*cmtx6^-1*link5^-1*cmtx5^-1*link4^-1*cmtx4^-1*link3^-1*cmtx3^-1*link2^-1*cmtx2^-1*link1^-1*cmtx1^-1*link0^-1;

end 