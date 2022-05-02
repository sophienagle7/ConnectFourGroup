function [] = gameSetup()
%sets up the tictactoe board and players/winner
figure('Name','Tic Tac Toe Game');
    plot(-1. -1)
    axis([0,3,0,3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    grid on

%settup the gameboard and the variable

state = [[-1 -1 -1]
         [-1 -1 -1]
         [-1 -1 -1]]; % (there is a winner when outcome does not equal -1)
outcome = -1; %decides if there is a winner

%variables
player = 1; %keeps track of who's turn it is

%while loop that keeps going until the outcome variable no longer equals
%negative one and there is therefore a winner of the game

%while winner == -1

end

function currentState = PlayOneRound(player, state)
%function takes in the current player and the current state and plays the
%game for one round
    [x, y] = ginput(1); %mouse position on the board
    %[col, row] =
    row = 2 - row; %tracks actual row within the state matrix
    if currentState(col +1, row + 1) ~= -1
        currentState = -1;
    else currentState(col +1, row + 1) = winner;
        currentState = -1;
        if winner
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


function winner = determinewinner(GameState)
    %this goes through and states each of the possible ways a player can
    %win the game (like how we did it in connect four)
    %Vertical Win
    if (GameState(1, 1) == GameState(2,1) && GameState(1,1) == GameState(3,1) && GameState(1,1) ~= -1)
        winner = GameState(1,1);
    elseif (GameState(1, 2) == GameState(2,2) && GameState(1,2) == GameState(3,2) && GameState(1,2) ~= -1)
        winner = GameState(1,2);
    elseif (GameState(1, 3) == GameState(2,3) && GameState(1,3) == GameState(3,3) && GameState(1,3) ~= -1)
        winner = GameState(1,3);
     %Horizontal Win
    elseif (GameState(1, 1) == GameState(1,2) && GameState(1,1) == GameState(1,3) && GameState(1,1) ~= -1)
        winner = GameState(1,1);
    elseif (GameState(2, 1) == GameState(2,2) && GameState(2,1) == GameState(2,3) && GameState(2,1) ~= -1)
        winner = GameState(2, 1);
    elseif (GameState(3, 1) == GameState(3,2) && GameState(3,1) == GameState(3,3) && GameState(3,1) ~= -1)
        winner = GameState(3,1);
     %Diagonal Winner
    elseif (GameState(1, 1) == GameState(2,2) && GameState(1,1) == GameState(3,3) && GameState(1,1) ~= -1)
        winner = GameState(1,1);
    elseif (GameState(1, 3) == GameState(2,2) && GameState(1,3) == GameState(3,3) && GameState(1,3) ~= -1)
        winner = GameState(1,3);
    elseif ~ismember(GameState, -1)
        winner = 2;
    else
        winner = -1;
    end
end

%comment for pushing






