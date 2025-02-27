function [x,y] = projectile_motion_drag(v,angle,g,m,A,cd,rho,y,x) % keep this function name and inputs the same for compatability
% PROJECTILE_MOTION_DRAG  Calculates the projectile motion of an object
% with drag
%
%inputs should be: 
%   v (velocity magnitude) - m/s
%   angle (jump angle) - degrees 
%   g (gravity) - m/s^2
%   m (projectile mass) - kg
%   A (projected area) - m^2 
%   cd (drag coefficient)
%   rho(air density) - kg/m^3
%   y (initial vertical position) - m
%   x (initial horizontal position) - m
%
%The outputs will be:
%   x (horizontal position vector) - Each x positon in incriments of 0.001
%   sec
%   y (vertical position vector) - Each y postion in incriments of 0.001
%   sec
%How It Works
%   This function calculates the trajectory by iterating through each time
%   incriment using a for loop to calculate the acceleration, velocity, and postion for both
%   the horizontal and vertical axis.
%Assumptions
%   -This function assumes that the initial acceleration is zero in both
%   the horizontal and vertical directions.
%   -The time step is 0.001 seconds
%   -The total time in the air does not exceed 100 sec
%   -The projectile lands at 0 m.

% Create a help entry here to explain this function when you type
% "help projectile_motion_drag" in the command window
% The help file should explain the inputs, outputs, how it works, and any
% key assumptions
% see example and https://www.mathworks.com/help/matlab/matlab_prog/add-help-for-your-program.html
% Creating a Function to Model Projecile Motion Taking Drag Into Account
% Anthony Perea
% MEGN 200 Section D
% Date 02/26/2021



% vy, initial vertical velocity, m/s, calculate based on v and angle
% vx, initial horizontal velocity, m/s, calculate based on v and angle
vy = v*sind(angle);
vx = v*cosd(angle);
% ay = 0, assume initial vertical acceleration is 0 m/s^2
% ax = 0, assume initial horizontal accleration is 0 m/s^2
ay = 0;
ax = 0;
% set time step delta_t to 0.001, s
delta_t = 0.001;
t=0:delta_t:100;        % create initial time vector guess from 0 to 100, s
% calculate drag constant based on cd, rho, A
D = 0.5*(rho*cd*A);
% create for or while loop to iterate through each time 
for n = 1:1:length(t);
    % calculate Eq(1) velocity magnitude v(n)
    v(n) = sqrt(vy(n)^2+vx(n)^2);
    % calculate Eq(2) ay(n+1)
    ay(n+1) = 0-g-(D/m)*v(n)*vy(n);
    % calculate Eq(3) vy(n+1)
    vy(n+1) = vy(n) + (ay(n)*delta_t);
    % calculate Eq(4) y(n+1)
    y(n+1) = y(n)+vy(n)*(delta_t)+(0.5*ay(n))*(delta_t^2);
    % calculate Eq(5) ax(n+1)
    ax(n+1) =  -(D/m)*v(n)*vx(n);
    % calculate Eq(6) vx(n+1)
    vx(n+1) = vx(n)+ax(n)*delta_t;
    % calculate Eq(7) x(n+1)
    x(n+1) = x(n)+vx(n)*delta_t+0.5*ax(n)*delta_t^2;
    % conditional statement to stop loop when vertical position y(n+1) <= 0
    % if using a for loop, use conditional statement here to break loop
    % if using a while loop, make sure to increment time step n
    if y(n+1) <= 0
        break
    end
    % end loop
end     % end function