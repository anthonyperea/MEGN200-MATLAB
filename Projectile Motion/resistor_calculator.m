function [nomValue, range] = resistor_calculator()
%RESISTOR_CALCULATOR prompts the user for the colors of resistor bands, and
%   calcuates the nominal value and tolerance.
%   
%   [nomValue, range] = resistor_calculator() returns the resistor value
%   and ranges as lower and upper values of resistance.
%   
%   INPUTS: none
%
%   OUTPUTS:
%   nomValue - the resistor nominal value in Ohms
%   range - a 2D array specifying the range of allowable values for the
%   given resistor.
%
%   DEFINITION: Resistor value is determined by the order of 3 colored
%   bands. Each color indicates an integer from 0 to 9, and the nominal
%   value is calculated as:
%   nomValue = (Band1*10 + Band2) * 10^Band3
%
%   numerical values for color bands (1-3) on a resistor
%   BLACK = 0;
%   BROWN = 1;
%   RED = 2;
%   ORANGE = 3;
%   YELLOW = 4;
%   GREEN = 5;
%   BLUE = 6;
%   VIOLET = 7;
%   GRAY = 8;
%   WHITE = 9;
%  
%   tolerance values for 4th band on a resistor
%   NONE = 0.20;
%   SILVER = 0.10;
%   GOLD = 0.05;
%
%   The range is calculated as:
%   lower = nomValue - 0.5*nomValue*tolerance
%   upper = nomValue + 0.5*nomValue*tolerance
%
%   Written by: Jordan Sturdy
%   Date: 24 Sept, 2020
%   Last modified: 28 Sept, 2020

% Initialize variable that indicates whether a resistor is valid or not.
% Set true to start, and change to false if resistor is misspecified.
bValid = true; 

bandStr = {'Black','Brown','Red','Orange','Yellow','Green','Blue',...
    'Violet','Gray','Grey','White'}; % Setup a character array of resistor band colors to compare the user input against.
bandVal = [0,1,2,3,4,5,6,7,8,8,9]; % numerical values for color bands (1-3) on a resistor.
tolStr = {'None','Silver','Gold'}; % Setup a character array of tolerance band options.
tolVal = [0.2,0.1,0.15]; % percentage tolerance based on band color.
 
% Prompt user to input the four resistor bands as colors. First setup the
% dialog prompt with one cell entry per returned value expected.
dlgprompt = {'Band 1 Color','Band 2 Color','Band 3 Color','Tolerance Band'};
resbands = inputdlg(dlgprompt,'Resistor band colors',1); % the 1 indicates how many lines per answer.

% Match resistor bands by looping over the first 3 inputs
vals = zeros(1,3); % initialize array for resistor value
for rb = 1:3
    % match the user input to the corresponding number for each band.
    % IgnoreCase to avoid issues with capitalization.
    temp = bandVal( contains(bandStr,resbands{rb},'IgnoreCase',true) ); % use logical array returned by "contains" to index bandVal
    if isempty(temp) % the specified band does not match one of the defined colors.
        bValid = false; % This is not a valid resistor
        break;  % exit the loop
    else
        vals(rb) = temp; % Store the integer value corresponding to the matched band color
    end
end

if bValid % Only if the resistor was valid based on the value bands
    nomValue = ( vals(1)*10 + vals(2) ) * 10^vals(3); % calculate the nominal value in Ohms

    temp = tolVal( contains(tolStr,resbands{4},'IgnoreCase',true) ); % tolerance band
    if isempty(temp) % Incorrect tolerance band specification
        bValid = false; % not a valid resistor (can't determine range)
        range = [NaN,NaN];
        warning('Not a valid tolerance band')
    else
        tolerance = temp; % assign tolerance percentage
        deviation = 0.5*nomValue*tolerance; % calculate the tolerance value
        % calculate the range (lower and upper bounds) of allowable resistor values
        range(1) = nomValue - deviation; 
        range(2) = nomValue + deviation; 
    

        % Format the resulting resistor value based on the magnitude of the nominal
        % value. 
        if nomValue < 1000 % report in Ohms
           fprintf('The resistor value is %0.0f Ohms, with a range of %0.0f to %0.0f Ohms\n',nomValue, range)
        elseif nomValue > 10000000 % report in MOhms
           fprintf('The resistor value is %0.2f MOhms, with a range of %0.2f to %0.2f MOhms\n',nomValue/1000000, range/1000000) 
        else % report in kOhms
           fprintf('The resistor value is %0.2f kOhms, with a range of %0.2f to %0.2f kOhms\n',nomValue/1000, range/1000)
        end
    end
else % resistor was not valid based on value bands.
    warning('Not a valid resistor')
end

end % function