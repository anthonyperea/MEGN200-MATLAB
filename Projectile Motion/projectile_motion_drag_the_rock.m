%% Modeling the Rock's Impossible Jump and Solving for Required Initial Velocity
%Part 2 and Part 3
% Anthony Perea 
% MEGN 200 Section D
% 02/26/2021

%% Part 2
clc;
close all;
clear all;
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
v = 7.63*1.15;
angle = 18;
g = 9.81;
m = 118;
A = 0.5*1.95;
cd = 1.2;
rho = 1.2;
y = 6.4;
x = 0;
% Call the projectile_motion_drag function with the function inputs
[x1,y1] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x);
% find out how far The Rock traveled horizontally under these conditions
x_final = x1(end);
x_need = 12.4;
fprintf('The Rock traveled %0.2f m, and he needed to go %0.2f m.',x_final,x_need);
% print out "The Rock traveled X1 m, and he needed to go X2 m."
% plot your results for Part 2 with a formatted plot
% include title, axis labels, legend, at least 14 font size
plot(x1,y1,'b-');
title('The Rock Jump Solution');
xlabel('x(m)');
ylabel('y(m)');
set(gca,'FontSize',14);
axis([0 13 0 7]);


%%
% Part 3
% Use the fsolve function to find the exact initial velocity to make the jump
% define x_final target
x_final = 12.4;
% [initial velocity solution] = fsolve(@initialvariable myfunction(inputs), initialguess)
% use this code line below for fsolve
[v_sol]=fsolve(@(v) find_solution(v,angle,g,m,A,cd,rho,y,x,x_final), v);
% if fsolve isn't installed (need optimization toolbox), use fzero: [v_sol]=fzero(@(v) find_solution(v,angle,g,m,A,cd,rho,y,x,x_final), v);
% print out "The Rock would need to jump at v_sol m/s to make the jump."
fprintf("The Rock would need to jump at %0.2f m/s to make the jump.",v_sol);
% assign v=v_sol
v = v_sol;
% Call the projectile_motion_drag function with the function inputs
[x2,y2] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x);
% plot your results for Part 2 with a formatted plot
% include title, axis labels, legend, at least 14 font size
plot(x2,y2,'b-');
title('The Rock Jump Solution');
xlabel('x(m)');
ylabel('y(m)');
set(gca,'FontSize',14);
axis([0 13 0 7]);