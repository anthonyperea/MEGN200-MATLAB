% MATLAB ASSIGNMENT #3
% Anthony Perea
% 1/26/21 Version #1.0

%% Tuesday Problem #1: 10x10 array of zeros
clc; clear all; close all;
n=10;
grid = zeros(10);
grid(:,1) = 1;
grid(1,:) = 2;
grid(:,n) = 3;
grid(n,:) = 4
%% Tuesday Problem #2: 2D array minipulation
clc; clear all; close all;
A = [ 1 0 1 0;0 2 0 2;3 1 3 1 ];
B = A(:,2);
leng_B = length(B)
C = A([1,3],:);
size_C = size(C)
D = A;
D(:,[1,2]) = [];
numel_D = numel(D)
E = A;
E = [A,[7;8;9]];
size_E = size(E)
%% Tuesday Problem #3: 5x5 Random Array
clc; clear all; close all;
n = 5;
my_array = rand(n);
above_vals = my_array >= 0.5;
my_array(above_vals) = 1;
my_array(~above_vals) = 0
my_sum = sum(my_array,'all');
percent = (my_sum/(n^2)) * 100
% When I ran the 5x5 matrix, the percentage hovered around 50% but there
% were large swings. Some as large as 60% and as small as 30%. When I ran t he 100x100 matrix, the swings were much
% smaller and were almost allways within one percent of 50%. This is because larger sample
% size have data that is closer to the expected value.
%% Thursday Problem #1: Magic Matrix
clc; clear all; close all;
X = magic(5)
matrix_A = X;
matrix_A([2,4],:) = [];
matrix_A(:,[2,4]) = []
matrix_B = X([2,3,4],[2,3,4])
matrix_C = [diag(X,-1), diag(X,1)]

%% Thursday Problem #2: Randi Matrix
clc; clear all; close all;
Matrix = randi([-5 5] , [3  4])
pos_vals = Matrix > 0;
neg_vals = Matrix < 0;
pos_sum = sum(Matrix(pos_vals),'all');
neg_sum = sum(Matrix(neg_vals),'all');
fprintf('The Positive Sum is: %d \n',pos_sum);
fprintf('The Negative Sum is: %d \n',neg_sum);

%% Thursday Problem #3: Excel
clc; clear all; close all;
[num,txt,raw]=xlsread('Top_NFL_Fantasy_Stats');
[M,I] = max(num(:,6));
player = txt{I + 1,2};
fprintf('%s has the most passing yards at %d yards.',player,M); 
