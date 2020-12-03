function rotational_mtx = rm(axis,inp_angle)
angle=deg2rad(inp_angle);
if axis == 'x'
    rotational_mtx=[1 0 0; 0 cos(angle) -sin(angle); 0 sin(angle) cos(angle)];
elseif axis == 'y'
    rotational_mtx=[cos(angle) 0 sin(angle); 0 1 0; -sin(angle) 0 cos(angle)];
elseif axis == 'z'
    rotational_mtx=[cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1];
else disp('err')
end

end

