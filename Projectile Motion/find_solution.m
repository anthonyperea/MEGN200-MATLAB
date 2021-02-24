function [x_sol] = find_solution(v,angle,g,m,A,cd,rho,y,x,x_final)
% find_solution designed to be used with the fsolve zero-finding function
% [output_driven_to_0] = function_name(inputs)

    % Call the projectile_motion_drag function to obtain results
    [x1,y1] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x);
    % fsolve will input different v values until the final x value minus the target x value is very close to 0  
    x_sol = x1(end)-x_final;
end