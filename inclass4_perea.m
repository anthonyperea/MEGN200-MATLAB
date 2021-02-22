% MATLAB ASSIGNMENT #4
% Anthony Perea
% 02/06/21 Version #1.0

%% Problem 1
clc;clear all; close all;
t = -2.5:0.01:4;
y = (t.^4)-(3.5*t.^3)-(2.5.*(t.^2))+(14*t)-6;
plot(t,y,'r-','LineWidth',2);
set(gca,'FontSize',12);
% My estimated roots are x = -2,0.5,2, and 3
p = [1,-3.5,-2.5,14,-6];
fprintf('The Roots of P are: ');
roots(p)
%% Problem 2
clc;clear all; close all;
r = 3;
theta = 0:(pi/100):2*pi;
x1 = r .* cos(theta);
y1 = r .* sin(theta) + r;
x2 = r .* cos(theta) - (r/2);
y2 = r .* sin(theta);
x3 = r .* cos(theta) + (r/2);
y3 = r .* sin(theta);
plot(x1,y1,'b-');
hold on;
plot(x2,y2,'r-');
plot(x3,y3,'y-');
set(gca,'FontSize',16);
axis([-6, 6, -3, 6]);
%% Problem 3
clc;clear all; close all;
load('uspopulation');
plot(years,pop,'ro');
xlabel('Year');
ylabel('U.S. Population');
title('U.S. Population Quadratic Model'); % create title
set(gca,'FontSize',12);
hold on;
P = polyfit(years,pop,2);
new = polyval(P,years);
plot(years,new,'k-');
est = polyval(P,2020);
per_error = (3.31*10^8-est)*100/(3.31*10^8);
legend('Census Data','Model','Location','North');
fprintf('The percent difference between the predicted and actual value is %0.3f %% \n',per_error);