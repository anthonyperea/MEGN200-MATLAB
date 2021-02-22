% MATLAB ASSIGNMENT Extra Credit #4
% Anthony Perea
% 02/17/21 Version #1.0
%% Problem #1
clc;clear all; close all;
rows = input('Enter The Number of Rows: ');
tri = zeros(rows);
for i = 1:rows
    tri(i,1) = 1;
    tri(i,i) = 1;
    if i >= 3
        for j = 2:(rows-1)
            tri(i,j) = tri((i-1),(j-1)) + tri((i-1),(j));
        end
    end
end
disp(tri);
%% Problem #2
clc;clear all; close all;
disp('Resistor Band Colors:');
disp('Black: 0');
disp('Brown: 1');
disp('Red: 2');
disp('Orange: 3');
disp('Yellow: 4');
disp('Green: 5');
disp('Blue: 6');
disp('Violet: 7');
disp('Gray: 8');
disp('White: 9');
disp('Tolerence Band Colors');
disp('No Band: 1');
disp('Silver: 2');
disp('Gold: 3');
first_color = input('Enter the First Band: ');
second_color = input('Enter the Second Band: ');
third_color = input('Enter the Third Color: ');
fourth_color = input('Enter the Tolerance Band: ');
nominal = (first_color*10 + second_color)*(10^third_color);
switch fourth_color
    case 1
        tolerance = 0.2;
    case 2
        tolerance = 0.1;
    case 3
        tolerance = 0.05;
end
if nominal >= 1000000
    nominal = nominal / 1000000;
    units = 'Mohms =';
elseif nominal >= 1000;
    nominal = nominal / 1000;
    units = 'kohms';
else
    units = 'ohms';
end
range_1 = nominal - (tolerance*nominal);
range_2 = nominal + (tolerance*nominal);
fprintf('The nominal value is %d %s. \n',nominal,units);
fprintf('The range is between %d and %d %s. \n',range_1,range_2,units);
% Case 1: nominal: 81 ohms range: 64.8-97.2 ohms
% Case 2: nominal: 5.6 kohms range: 5.04-6.16 kohms
% Case 3: nominal: 33 Mohms range: 31.35-34.65 Mohms