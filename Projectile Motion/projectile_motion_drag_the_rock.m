%% Title of Code/Problem
% First & Last Name
% MEGN 200 Section
% Date

%% Part 2
% The Rock needs to jump 12.4 m horizontally and fall 6.4 m vertically
% initial guess for The Rocks trajectory
% v, initial velocity
% angle, jump angle
% g, gravity, m/s^2
% m, mass, kg
% A, drag area, m^2
% cd, dimensionless drag coefficient
% rho, air density, kg/m^3
% y, initial vertical position, m
% x, initial horizontal position, m

% Call the projectile_motion_drag function with the function inputs
% find out how far The Rock traveled horizontally under these conditions
% print out "The Rock traveled X1 m, and he needed to go X2 m."
% plot your results for Part 2 with a formatted plot
% include title, axis labels, legend, at least 14 font size

%%
% Part 3
% Use the fsolve function to find the exact initial velocity to make the jump
% define x_final target
% [initial velocity solution] = fsolve(@initialvariable myfunction(inputs), initialguess)
% use this code line below for fsolve
[v_sol]=fsolve(@(v) find_solution(v,angle,g,m,A,cd,rho,y,x,x_final), v);
% if fsolve isn't installed (need optimization toolbox), use fzero: [v_sol]=fzero(@(v) find_solution(v,angle,g,m,A,cd,rho,y,x,x_final), v);
% print out "The Rock would need to jump at v_sol m/s to make the jump."
% assign v=v_sol
% Call the projectile_motion_drag function with the function inputs
% plot your results for Part 2 with a formatted plot
% include title, axis labels, legend, at least 14 font size