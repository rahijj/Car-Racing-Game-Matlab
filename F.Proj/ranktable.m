function [] = ranktable(input,time)
%This saves the players name and time, and then creates a table of all the
%players and their time.
%   This functions also loads a file named HSfile.mat which has the records
%   of the previous players and their time and updates it every time a new
%   player playes the game.
clear score
load('HSfile.mat');
input=char(input);
i=numel(score(:,1));
score{i+1,1}=[input];
score{i+1,2}=[time];
save('HSfile.mat','score');
cell2table(score,'VariableNames',{'NAME' 'SCORE'})
end


