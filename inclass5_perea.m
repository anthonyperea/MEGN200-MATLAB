% MATLAB ASSIGNMENT #5
% Anthony Perea
% 02/09/21 Version #1.0

%% Tuesday Problem 1
clc;clear all; close all;
a = 5;
b=6;
c=3;
if a > 3 && c < 7
    result = a + b*c;
elseif a > 1 && b == 3
    result = a*c;
elseif b == 5 || c < 5
    result = b-15;
end
message = ['result = ' num2str(result)];
disp(message)
% This will give you 23
if a > 3 && c < 7
    result = a + b*c;
end
if a > 1 && b == 3
    result = a*c;
end
if b == 5 || c < 5
    result = b-15;
end
message = ['result = ' num2str(result)];
disp(message)
% This will give you -9
% In part a, only one statement is triggered. In this case, the first
% staement is triggered since a is greater than 3 and c is less than 7. SInce this is an if else statement, the computer will stop. In
% part b, this statement is triggerd, but the last statement is also
% triggerd, so it overwrites the value of result. The computer does not
% stop.

%% Tuesday Problem 2
clc;clear all; close all;
angle = input('Enter the desired angle: ');
type = input('Enter 1 for degrees and enter 2 for radians: ');
switch type
    case 1
        sin_ang = sind(angle);
        cos_ang = cosd(angle);
    case 2
        sin_ang = sin(angle);
        cos_ang = cos(angle);
end
fprintf('The sine of %f is %f and the cosine is %f. \n',angle,sin_ang,cos_ang);

%% Tuesday Problem 3
clc;clear all; close all;
side_1 = input('Enter the first side: ');
side_2 = input('Enter the second side: ');
side_3 = input('Enter the third side: ');
my_tri = sort([side_1,side_2,side_3]);
if (my_tri(1)+my_tri(2)) < my_tri(3)
    disp('This is not a real triangle.');
elseif ((my_tri(1) == my_tri(2)) && (my_tri(2) == my_tri(3)))
    disp('This is a an equilateral triangle.')
elseif ((my_tri(1) == my_tri(2)) | (my_tri(2) == my_tri(3)))
    disp('This is an isosceles triangle.')
else
    disp('This is a scalene triangle.')
end

%% Thursday Problem 1
clc;clear all; close all;
% The for loop will run 10 times and have an output of 10
x = 10;
sum1 = 0;
for k = 1:x
    sum1 = sum1 + 1;
end
disp('sum =');
disp(sum1);
%Geometric Series
x = 2;
N = 5;
series = 0;
for m = 1:N
    series = series + x^m;
end
message = ['The sum for the geometric series with x = ',num2str(x),' and ',num2str(N),' terms is: ',num2str(series)];
disp(message);
% The sum of the geometric series is 62. The for loop will run 5 times.
% num2string turns a number to a string that can be displayed to the user.
% It changes the variable type
sum2 = 0;
while sum2 <= 10
    sum2 = sum2 + 3;
end
disp('sum =');
disp(sum2);
% The for loop will run four times and have a final sum of 12. 
%% Thursday Problem 2
clc;clear all; close all;
x = input('Enter a number: ');
factor = 1;
for i = x:-1:1
    factor = i * factor;
end
fprintf('The factorial of %d is %d \n',x,factor);
factor = 1;
i = 0;
while i < x
    i = i + 1;
    factor = factor * i;
end
fprintf('The factorial of %d is %d \n',x,factor);
%% Thursday Problem 3
clc;clear all; close all;
years = input('Enter the number of years: ');
days = years * 365;
pennies = 0.01;
i = 0;
while i <= days;
    pennies = (i*0.01) + pennies;
    i = i + 1;
end
fprintf('Over %d years, your accumulated savings is $%0.2f and your final contribution is $%0.2f',years,pennies,days/100);
%% Thurday Problem 4
clc;clear all; close all;
years = 0:1/365:(30-(1/365));
finalday = 30*365;
savings = 1;
t = 1;
for j = 2:finalday
    t = t + 1;
    savings(j) = savings(j-1) + t;
end
plot(years,savings./100);
xlabel('Years');
ylabel('$ Saved');
title('Savings after 30 years');