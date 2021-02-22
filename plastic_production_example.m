%% Example: Plastic Generation
clc;clear all;close all;
[num,text,raw]=xlsread('Plastic_Production_Data.csv');  % load data using xls read
year = num(:,1);
plastic_prod = num(:,2);
figure(1);  % can create multiple figures with on script, figure(1), figure(2), figure(n)
plot(year,plastic_prod,'r.','MarkerSize',14);    % discrete data points usually represented as points, can change size
xlabel('Year'); % create xlabel
ylabel('Plastic Production (million tonnes)'); % create ylabel
title('Global Plastic Production fromn 1950 to 2015'); % create title
set(gca,'FontSize',14); % sets font size for entire figure
P = polyfit(year, plastic_prod, 3);  % use polyfit(x,y,order) to create 3rd order polynomial vector
Y = polyval(P,year);    % evaluate the create polynomial vector P at the x data points given by year
hold on;    % hold on the wait to plot the fit line on top of the data points
plot(year,Y,'k-','LineWidth',2);     % plot line of best fit, change line width
legend('Data', 'Cubic Fit','Location','NorthWest');    % create and position legend
plastic_per_person_2015 = plastic_prod(end)*2.2E9/7.7E9;    % calculate plastic per person on earth
fprintf('Plastic generated per person each year is: %0.0f lb.\n',plastic_per_person_2015);
year_2050 = polyval(P,2050);    % evalutate the vector polynomila P at the year 2050 to get a projection
fprintf('Estimated plastic production by 2050 will be: %0.0f.\n',year_2050);