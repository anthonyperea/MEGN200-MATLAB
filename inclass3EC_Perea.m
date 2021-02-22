% MATLAB Extra Credit #3
% Anthony Perea
% 1/31/21 Version #1.0

%% Extra Credit #1
clc; clear all; close all;
[NUM,TXT,RAW] = xlsread('HW_Grades');
[M1,I1] = min(NUM(1,:));
NUM(1,I1) = 0;
[M2,I2] = min(NUM(2,:));
NUM(2,I2) = 0;
[M3,I3] = min(NUM(3,:));
NUM(3,I3) = 0;
LukeAve = sum(NUM(1,:)) / (length(NUM(1,:)) - 1);   
MegAve = sum(NUM(2,:)) / (length(NUM(2,:)) - 1);
MarcAve = sum(NUM(3,:)) / (length(NUM(3,:)) - 1);
mean_studs =(LukeAve + MegAve + MarcAve)/3;
fprintf("Megan's average homework score was %0.2f  \n",LukeAve);
fprintf("Luke's average homework score was %0.2f  \n",MegAve);
fprintf("Marcus' average homework score was %0.2f  \n",MarcAve);
fprintf("The class' average homework score was %0.2f  \n",mean_studs);
A_studs = string(TXT([2,3,4],1));
A_studs = A_studs(:);
A_logic = [LukeAve,MegAve,MarcAve] > 90;
A_studs = A_studs(A_logic);
fprintf('%s got an A in the class! \n', A_studs);
%% Extra Credit #2
clc; clear all; close all;
[num,txt,raw] = xlsread('Top_NFL_Fantasy_Stats');
[pass_yds,in1] = sortrows(num,6 ,'descend');
[tds,in2] = sortrows(num,7,'descend');
[rush_yds,in3] = sortrows(num,9,'descend');
fprintf('The top 10 players by passing yards: \n');
mat1 = string(txt(in1([1:10],:)+1,2));
fprintf('%s \n',mat1)
fprintf(' \nThe top 10 Players by touch downs: \n');
mat2 = string(txt(in2([1:10],:)+1,2));
fprintf('%s \n',mat2)
fprintf('\nThe top 10 Players by rushing yards: \n');
mat3 = string(txt(in3([1:10],:)+1,2));
fprintf('%s \n',mat3)
