function [] = gameSetup()
%sets up the tictactoe board and players/winner
figure('Name','Tic Tac Toe Game');
    plot(-1. -1)
    axis([0,3,0,3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    grid on

%settup the gameboard and the figures

state = [[-1 -1 -1]
         [-1 -1 -1]
         [-1 -1 -1]]; % (there is a winner when outcome does not equal -1)
outcome = -1;

%while loop that keeps going until the outcome variable no longer equals
%negative one and there is therefore a winner of the game

