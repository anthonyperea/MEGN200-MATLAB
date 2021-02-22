% line 4 GameVer = '2.7';
% I changed the version to 2.7

% line 111 logo_stl = text(72, 100, 'Anthony Presents', 'FontSize', 20, 'Color',[1 1 1], 'HorizontalAlignment', 'center');
% This line changes the text in the game. I changed it to Anthony Presents

%line 197 gameover = false;
% This line give the player a game over when they hit the pipe. My bird can
% now go through pipes

% line 245 if Score < Best
% This line assignes a new value to the high score when they player beats
% the previous high score. I changed it to give the player their lowest
% score.

% line 260 score_report = {sprintf('Score: %d', Score), sprintf('Worst: %d', Best)};
% This reports the player's score.
% I changed it to say worst score to match my changes above.

% line 405 Score = -50;
% I changed the initial score from 0 to -50.

%line 514 Score = Score + 5;
% I changed the scoring system to give 5 points instead of just 1.