%% Modeling the Projectile Motion of a Baseball in the Conditions: One With No Drag, One With Drag at Sea Level, and One With Drag In the Denver Area
% Anthony Perea
% MEGN 200 Section D
% Date 02/26/2021

%% Part 1
% Setup parameters to model a baseball projectile with drag
clc;
close all;
clear all;
% v, initial velocity
% angle, jump angle
% g, gravity, m/s^2
% m, mass, kg
% A, drag area, m^2
% cd, dimensionless drag coefficient
% rho, air density, kg/m^3
% y, initial vertical position, m
% x, initial horizontal position, m
v = 50;
angle = 35;
g = 9.81;
m = 0.145;
A = pi*(0.0366)^2;
cd = 0.5;
rho = 1.2;
y = 0;
x = 0;
% Call the projectile_motion_drag function times with the function inputs
[x1,y1] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x);
plot(x1,y1,'r-');
hold on;

% calculate the max height and position of the baseball
[M1,I1] = max(y1);
pos1 = x1(end)/2;
% change cd drag coefficient for no drag condition
cd = 0;
% Call the projectile_motion_drag function with the function inputs
[x2,y2] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x);
plot(x2,y2,'k--');
% calculate the max height and position of the baseball
[M2,I2] = max(y2);
pos2 = x2(end)/2;
% change cd drag coefficient back to 0.5 and rho to 82% of sea level air density
cd = 0.5;
rho = 0.82 * rho;
% Call the projectile_motion_drag function with the function inputs
[x3,y3] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x);
% calculate the max height and position of the baseball
[M3,I3] = max(y3);
pos3 = x3(end)/2;
% Plot results on the same plot as shown in baseball example plot
plot(x3,y3,'b-');
% plot commands here
% include title, axis labels, legend, at least 14 font size
title('Baseball Projectile Motion with/without Drag');
xlabel('x(m)');
ylabel('y(m)');
set(gca,'FontSize',14);
legend('Sea Level Drag','Without drag','Denver drag');
% use the axis function to set axis limits, i.e. axis([xmin xmax ymin ymax])
axis([0 300 0 50]);
% print out the % differece in vertical and horizontal distance of the baseball relative to sea level
percent_vert = 100*((M3-M1)/M1);
percent_horiz = 100*((pos3-pos1)/pos1);
fprintf('The vertical percent difference was %0.2f percent and the horizontal percent difference was %0.2f percent.',percent_vert,percent_horiz);