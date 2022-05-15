function [] = TicTacToeGame()
%sets up the tictactoe board and players/winner
msg = "Welcome! Please Select The Game You Would Like To Play.";

figure('Name','Tic Tac Toe Game');
    close all
    figure('Name','Tic Tac Toe');
    plot(-1. -1)
    axis([0 3 0 3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    set(gca,'xTickLabel','')
    set(gca,'yTickLabel','')
    grid on
    set(gcf, 'color', [0.4940 0.1840 0.5560])

%settup the gameboard and the variable
state = [[-1 -1 -1]
         [-1 -1 -1]
         [-1 -1 -1]]; % (there is a winner when outcome does not equal -1)
outcome = -1; %decides if there is a winner

%variables
player = 1; %keeps track of who's turn it is

%instructions listed on top of the board telling players how to participate
instructions = title('select your marker placement by clicking square of your choice');
    set(instructions, 'color', 'w')
    set(instructions,'FontWeight','bold')
    set(instructions,'FontSize',15)

%while loop that keeps going until the outcome variable no longer equals
%negative one and there is therefore a winner of the game

while outcome == -1
    turn = PlayOneRound(player, state);
    if turn == -1 %full spot --> player needs to click again
        title('this spot is taken, please select another');
    else
        state = turn;
        player = mod(player+ 1,2);
        outcome = won(state);
    end
end
if outcome == 0 
    title('PLayer One Wins!', 'FontSize', 20)
    xlabel('')
    homepage(msg)
elseif outcome == 1
    title('Player Two Wins!', 'FontSize', 20)
    xlabel('')
    homepage(msg)
else
    title('Tie', 'FontSize', 20)
    xlabel('')
    homepage(msg)
end
end

function state = PlayOneRound(player, state)
%function takes in the current player and the current state and plays the
%game for one round
    [x, y] = myginput(1,'crosshair'); %mouse position on the board
    [col, row] = mousePos(x, y); %corresponding row and column given the current mouse position
    row = 2 - row; %tracks actual row within the state matrix
    if state(col+1, row+1) ~= -1
        state = -1;
    else 
        state(col +1, row + 1) = player; %changes the game state to X and draws the X
        if player
            create_0(col, 2 - row);
        else
            create_X(col, 2 - row);
        end
    end
end

function [column, row] = mousePos(x, y)
    column = floor(x);
    row = floor(y);
    if row > 2 
        row = 2;
    end
    if column >2 
        column = 2;
    end
end

%function draws the X marker on the board (X-chip)
function create_X(col, row)
    hold on
    x = 0:1;
    xSide1 = 0:1;
    xSide2 = 1-x;
    plot(x+col, xSide1+row, 'r', 'LineWidth',8)
    plot(x+col, xSide2+row, 'r', 'LineWidth',8)
    hold off
end

%Function draws the 0 marker on the board (0-chip)
function create_0(col, row)
    hold on
    i = 0:0.1:2.1*pi;
    x = cos(i)/2+0.5;
    y = sin(i)/2+0.5;
    plot(x+col, y+row, 'b', 'LineWidth',8)
    hold off
end

function won = won(state)
    %this goes through and states each of the possible ways a player can
    %win the game (like how we did it in connect four)
    %Vertical Win
    if (state(1, 1) == state(2,1) && state(1,1) == state(3,1) && state(3,1) ~= -1)
        won = state(1,1);
    elseif (state(1, 2) == state(2,2) && state(1,2) == state(3,2) && state(1,2) ~= -1)
        won = state(1,2);
    elseif (state(1, 3) == state(2,3) && state(1,3) == state(3,3) && state(1,3) ~= -1)
        won = state(1,3);
     %Horizontal Win
    elseif (state(1, 1) == state(1,2) && state(1,1) == state(1,3) && state(1,1) ~= -1)
        won = state(1,1);
    elseif (state(2, 1) == state(2,2) && state(2,1) == state(2,3) && state(2,1) ~= -1)
        won = state(2, 1);
    elseif (state(3, 1) == state(3,2) && state(3,1) == state(3,3) && state(3,1) ~= -1)
        won = state(3,1);
     %Diagonal Winner
    elseif (state(1, 1) == state(2,2) && state(1,1) == state(3,3) && state(1,1) ~= -1)
        won = state(1,1);
    elseif (state(1, 3) == state(2,2) && state(1,3) == state(3,1) && state(2,2) ~= -1)
        won = state(1,3);
    %tie
    elseif ~ismember(state, -1)
        won = 2;
    else
        won = -1;
    end
end

%driver: Sophie debuggers: Ashley and Jess
