% MATLAB ASSIGNMENT #2
% Anthony Perea
% 1/21/21 Version #1.0
clc;clear all; close all;
%% Tuesday Problem 1 Mean, min, and max
list(1) = input('Enter the first number: ');
list(2) = input('Enter the second number: ');
list(3) = input('Enter the third number: ');
list(4) = input('Enter the fourth number: ');
list(5) = input('Enter the fifth number: ');
max_list = max(list);
min_list = min(list);
mean_list = mean(list);
fprintf('The max was %0.2f, the min was %0.2f, and the mean was %0.2f \n',max_list,min_list,mean_list);

%% Tuesday Problem 2 Minimum Value
list_two(1) = input('Enter the first number: ');
list_two(2) = input('Enter the second number: ');
list_two(3) = input('Enter the third number: ');
min_val = input('Enter the minimum value: ');
list_three = list_two > min_val;
fprintf('Greater than the minimum value: ');
disp(list_two(list_three));

%% Tuesday Problem 3 ID Numbers
iD_nums = [104,156,126,178,101];
scores = [93,86,75,96,89];
a_studs = scores >= 90;
disp('The IDs of Students Who Got an A:  ');
disp(iD_nums(a_studs));

%% Thursday Problem 1
x = 0:0.1:100;
y = ((pi .* (x.^2))/0.1) .* (1.5/50) .* 3.8575;
plot(x,y,'ro');
title('Value of Crops for the Radius of Center-Pivot Irrigation System');
xlabel('Radius(m)');
ylabel('Value ($)');
one_hond = ((pi *(100^2))/0.1) .* (1.5/50) .* 3.8575;
soln = ceil(1000000/one_hond);
fprintf('It takes %d 100m radius fields to raise $1 million worth of corn. \n',soln);

%% Thursday Problem 2 Projectile
g = 9.81;
vel = 715;
t = 0:0.1:200;
y = (vel.*t)-(0.5.*g.*(t.^2));
plot(t,y,'ro');
title('Bullet Trajectory');
xlabel('Time (s)');
ylabel('Height (m)');
hold on;
pos_vals = y >= 0;
x = t(pos_vals);
y = (vel.*x)-(0.5.*g.*(x.^2));
plot(x,y,'bo');
title('Bullet Trajectory');
xlabel('Time (s)');
ylabel('Height (m)');
[y_max,x_ind] = max(y);
fprintf('The maximum height is %0.2fm at t = %0.2fs\n', y_max, x(x_ind));
hit_ground = (2*vel)/(2*0.5*g);
fprintf('The bullet will hit the ground at t = %0.2fs\n', hit_ground);