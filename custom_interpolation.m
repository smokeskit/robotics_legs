function [x_points y_points z_points] = custom_interpolation(x,y,z,n,Tension,visual)

clear XiYiZi Px Py Pz


Px=[x(1) x x(end)];	
Py=[y(1) y y(end)];	
Pz=[z(1) z z(end)];	

% Note first and last points are repeated so that spline curve passes
% through all points

x_points=[];
y_points=[];
z_points=[];
for k=1:length(Px)-3
    
    [XiYiZi]=crdatnplusoneval([Px(k),Py(k),Pz(k)],[Px(k+1),Py(k+1),Pz(k+1)],[Px(k+2),Py(k+2),Pz(k+2)],[Px(k+3),Py(k+3),Pz(k+3)],Tension,n);
    % % XiYiZi is 3D interpolated data
    x_points=[x_points XiYiZi(1,:)];
    y_points=[y_points XiYiZi(2,:)];
    z_points=[z_points XiYiZi(3,:)];
    
end
    if visual == 1
            figure(100), hold on, grid on
            plot3(x_points(1,:),y_points(1,:),z_points(1,:),'b','linewidth',2) 
            plot3(Px,Py,Pz,'ro','linewidth',2)
            view(52,20)
    elseif visual == 0
            return
    end
        
        
end

% title('\bf 3D Cardinal Spline')
% xlabel('\bf X-axis')
% ylabel('\bf Y-axis')
% zlabel('\bf Z-axis')
% legend('\bf Interpolated Data','\bf Control Points','Location','NorthEast')
% grid on
% view(3);
% box;

