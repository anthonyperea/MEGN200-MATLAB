% MATLAB ASSIGNMENT #2 Extra Credit
% Anthony Perea
% 1/21/21 Version #1.0
%% Extra Credit 2 Problem 1
load('fibonacci.mat')
great_logic = fibonacci > (1*10^100);
list = fibonacci(great_logic);
fprintf('The first fibonacci number greater than 1E100 is %d', list(1));

%% Extra Credit 2 Problem 2
P = input('Enter the principle dollar amount: ');
r = input('Enter the interest rate: ');
t = 1:1:30;
n = 12;
comp = P .* ((1 + (r / n)) .^ (n .* t));
plot(t,comp,'r-');
hold on;
simple = P .* (1+(r .* t));
plot(t,simple,'b:');
title('Amount Saved vs. Years');
xlabel('Time (years)');
ylabel('Amount Saved ($)');
comp_multi = comp(30) / P;
simp_multi = simple(30) / P;
fprintf('Your savings has been multiplied %0.2f times using compound interest. \n',comp_multi);
fprintf('Your savings has been multiplied %0.2f times using simple interest. \n',simp_multi);