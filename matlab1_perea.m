% MATLAB ASSIGNMENT #1
% Anthony Perea
% 1/14/21 Version #1.0

%% Ploting Sin(x) and Cos(x) on the same plot
x=0:pi/100:2*pi; %assigns x from 0 to 2pi with incriments of pi/100
y1=sin(2*x); %assigns y1
y2=2*cos(2*x); %assigns y2
plot(x,y1,'r--',x,y2,'bo-'); %plots the graph
title('Plot of sin(2x) and 2cos(2x)'); %create title
xlabel('x'); %label x
ylabel('y'); %label y

%% Record and print your name date of birth
year=input('Enter year: '); %get year
month=input('Enter month: ','s'); %get month
day=input('Enter day: '); %get day
fprintf('Your birthday is %s %i, %i',month,day,year); %output date