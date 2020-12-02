% % this is just test model for kinematics and visualization
% % use .stl files and functions from folder to run this

% % interpolation made with help of Dr. Murtaza Khan work
% % Author Reference : http://www.linkedin.com/pub/dr-murtaza-khan/19/680/3b3
% % Research Reference: http://dx.doi.org/10.1007/978-3-642-25483-3_14

clc
close all
clear all

masses
get_the_0angles_state_ext
loop_initial_LL=[0 0 0 0 0 0];
loop_initial_RL=[0 0 0 0 0 0];
Opt=optimset('Algorithm', 'levenberg-marquardt','TolFun',1e-6,'TolX',1e-6);

LL_start_point=LL_FK_FH_1_1([0 0 0 0 0 0],eye(4,4));
LL_start_point=[LL_start_point([1:3],4)]'+[0 35 0]*1e-3;
[angle,fval,local_flag_ll]=fsolve(@(x) LL_IK_FH_1_2(x,[LL_start_point,[1 1 1]]',eye(4,4)),[0 0 0 0 0 0],Opt);

x=[LL_start_point(1) LL_start_point(1)+[0 0 0 0 0 0 0]*-1*1e-3                                LL_start_point(1)+[0 0 0 0 0 0 0]*1e-3];
y=[LL_start_point(2) LL_start_point(2)+[0 -35/4 -35/2 -35 -35*2*3/4 -35*2*7/8 -70]*1e-3       LL_start_point(2)+[70 35*2*7/8 35*2*3/4 35 35/2 35/4 0]*-1*1e-3];
z=[LL_start_point(3) LL_start_point(3)+[0 2 3.5 6 8.5 7.5 0]*1e-3                             LL_start_point(3)+[0 0 0 0 0 0 0]*1e-3];

[LL_x_points LL_y_points LL_z_points]=custom_interpolation([x],[y],[z],1,0.75,1);
LL_trajectory=[LL_x_points' LL_y_points' LL_z_points'];

for k=2:length(LL_trajectory(:,1))
    if  (abs(LL_trajectory(k,1)-LL_trajectory(k-1,1))<1e-4) & (abs(LL_trajectory(k,2)-LL_trajectory(k-1,2))<1e-4) & (abs(LL_trajectory(k,3)-LL_trajectory(k-1,3))<1e-4) %#ok<*AND2>
        LL_trajectory(k,:)=[0 0 0];
    end
end
LL_trajectory=LL_trajectory(~all(LL_trajectory==0,2),:);

[fi(1,:),fval,local_flag_ll]=fsolve(@(x) LL_IK_FH_1_2(x,[LL_trajectory(1,:),[1 1 1]]',eye(4,4)),angle,Opt);
for i=2:length(LL_trajectory(:,1))
    [fi(i,:),fval,local_flag_ll(i)]=fsolve(@(x) LL_IK_FH_1_2(x,[LL_trajectory(i,:),[1 1 1]]',eye(4,4)),fi(i-1,:),Opt);
end

RL_start_point=RL_FK_FH_1_1([0 0 0 0 0 0],eye(4,4));
RL_start_point=[RL_start_point([1:3],4)]'+[0 -35 0]*1e-3;
[angler,fval,local_flag_lr]=fsolve(@(x) RL_IK_FH_1_2(x,[RL_start_point,[1 1 1]]',eye(4,4)),[0 0 0 0 0 0],Opt); %#ok<*ASGLU>

clear x y z k i

x=[RL_start_point(1) RL_start_point(1)+[0 0 0 0 0 0 0]*1e-3                            RL_start_point(1)+[0 0 0 0 0 0 0]*1e-3 ];
y=[RL_start_point(2) RL_start_point(2)+[0 35/4 35/2 35 35*2*3/4 35*2*7/8 70]*1e-3      RL_start_point(2)+[-70 -35*2*7/8 -35*2*3/4 -35 -35/2 -35/4 0]*-1*1e-3 ];
z=[RL_start_point(3) RL_start_point(3)+[0 0 0 0 0 0 0]*1e-3                            RL_start_point(3)+[0 2 3.5 6 8.5 7.5 0]*1e-3 ];

[RL_x_points RL_y_points RL_z_points]=custom_interpolation([x],[y],[z],1,0.75,1); %#ok<*NCOMMA>
RL_trajectory=[RL_x_points' RL_y_points' RL_z_points'];
for k=2:length(RL_trajectory(:,1))
    if  (abs(RL_trajectory(k,1)-RL_trajectory(k-1,1))<1e-4) & (abs(RL_trajectory(k,2)-RL_trajectory(k-1,2))<1e-4) & (abs(RL_trajectory(k,3)-RL_trajectory(k-1,3))<1e-4)
        RL_trajectory(k,:)=[0 0 0];
    end
end
RL_trajectory=RL_trajectory(~all(RL_trajectory==0,2),:);

[fir(1,:),fval,local_flag_rl]=fsolve(@(x) RL_IK_FH_1_2(x,[RL_trajectory(1,:),[1 1 1]]',eye(4,4)),angler,Opt);
for i=2:length(LL_trajectory(:,1))
    [fir(i,:),fval,local_flag_rl(i)]=fsolve(@(x) RL_IK_FH_1_2(x,[RL_trajectory(i,:),[1 1 1]]',eye(4,4)),fir(i-1,:),Opt);
end


if length(fi)~=length(fir)
    disp('length fi not equal length fir')
    return
else
    timeline=0:0.05:(length(fi(:,1))-1)*0.05; 
end

figure(10), grid on, hold on
plot(local_flag_ll, '')
plot(local_flag_rl)
xlim([1,15])

disp('######')
disp('now you can open and run flying_walk_straight_kin_two_legs_RT_ready_2_1_show_.slx')

