% MATLAB ASSIGNMENT #1
% Anthony Perea
% 1/14/21 Version #1.0

%% Ploting Sin(x) and Cos(x) on the same plot
x=0:pi/100:2*pi;
y1=sin(2*x);
y2=2*cos(2*x);
plot(x,y1,'r--',x,y2,'bo-');
title('Plot of sin(2x) and 2cos(2x)');
xlabel('x');
ylabel('y');

%%Record and print your name date of birth
year=input('Enter year: ');
month=input('Enter month: ','s');
day=input('Enter day: ');
fprintf('Your birthday is %s %i, %i',month,day,year);