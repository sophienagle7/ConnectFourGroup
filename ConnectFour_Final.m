function [] = ConnectFour_Final()
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Constructing Board

row_0x = [0, 7]; row_0y = [0, 0];
row_1x = [0, 7]; row_1y = [1, 1];
row_2x = [0, 7]; row_2y = [2, 2];
row_3x = [0, 7]; row_3y = [3, 3];
row_4x = [0, 7]; row_4y = [4, 4];
row_5x = [0, 7]; row_5y = [5, 5];
row_6x = [0, 7]; row_6y = [6, 6];
column_0x = [0, 0]; column_0y = [0, 6];
column_1x = [1, 1]; column_1y = [0, 6];
column_2x = [2, 2]; column_2y = [0, 6];
column_3x = [3, 3]; column_3y = [0, 6];
column_4x = [4, 4]; column_4y = [0, 6];
column_5x = [5, 5]; column_5y = [0, 6];
column_6x = [6, 6]; column_6y = [0, 6];
column_7x = [7, 7]; column_7y = [0, 6];

clf
plot(row_0x, row_0y, 'w', row_1x, row_1y, 'w', row_2x, ...
    row_2y, 'w', row_3x, row_3y, 'w', row_4x, row_4y, 'w', ...
    row_5x, row_5y, 'w', row_6x, row_6y, 'w', ...
    column_0x, column_0y, 'w', column_1x, column_1y, ...
    'w', column_2x, column_2y, 'w', column_3x, column_3y, 'w', ...
    column_4x, column_4y, 'w', column_5x, column_5y, 'w', ...
    column_6x, column_6y, 'w', column_7x, column_7y, 'w')
axis off, axis square, ...
     set(gcf, 'color', 'b')

%creating a gameboard using rows, columns, and plots
%setting color of background blue and grid to white

instructions = title('select your chip placement by clicking the top of your chosen column');
    set(instructions, 'color', 'w')
    set(instructions,'FontWeight','bold')
    set(instructions,'FontSize', 15)

%setting title for board with instructions on how to play
%driver: ashley debuggers: jess and sophie

%% Defining Variables and Setting Game Parameters

game = zeros(6, 7);
horizontalCheck = 0; % checks for horizontal winner
verticalCheck = 0; % checks for vertical winner
diagonalCheckRL = 0; % checks for diagonal winner (right to left)
diagonalCheckLR = 0; % checks for diagonal winner (left to right)
row_click= 0; % row select for 'game' matrix
turn = 42; % max turns that can be played 
whos_turn = 1; %alternates betweem player one and player two

player_color = {'r';'y'}; %sets chip color to magenta and yellow


while (turn ~= 0) && (horizontalCheck == 0) && ...
        (verticalCheck == 0) && (diagonalCheckLR == 0)  && (diagonalCheckRL == 0)
% turn
% horizontalCheck
% verticalCheck
% diagonalCheckRL
% diagonalCheckLR
%creating gameboard and setting variables that will be used later when
%checking for wins and playing the game
%using while statement to establish when the game should be played or not
%(when there is no win and there are turns left [maximum 42 turns permitted])

%driver: ashley debugger: jess and sophie

%% Players One and Two Turn
    [x, ~] = myginput(1,'crosshair');  %controls the click function to determine where chip is placed, crosshair takes out coordinate lines
    row = 1;
    while row+1 <= 6
        if game((row+1), ceil(x)) == 1 || game((row+1), ceil(x)) == 2 && game((row),ceil(x))== 0
            
%selecting the column using a click, ceil rounds the click location to the
%nearest whole integer which determines the column that the click is
%associated with
%if == 1 or 2, indicates that the bottom row is not occupied, so chip goes
%in that slot
            row_click = row;
            break
        elseif row <= 6
            row_click = row + 1;
%this suggests that the selected slot is occupied so the chip will have to
%go in the slot above (row+1)
        end
        row = row+1;
    end
    if game(row_click, ceil(x))==0    
        game(row_click, ceil(x)) = whos_turn;
        [dx, dy] = disp_chip(row_click, ceil(x));
        player_one_chip = text(dx + .5, dy + 2.55, '.', ...
        'fontsize', 300, 'FontName', 'Comic Sans MS', ...
        'horizontalalignment', 'center');
        set(player_one_chip, 'color', player_color{whos_turn})
%the above code creates the chips for the players
    end 

%drivers and debuggers: ashley, sophie, and jess

%% Look for win by rows for Players One and Two
msg = "Welcome! Please Select The Game You Would Like To Play.";
    for ii = 1:6
        for jj = 1:4
            minihorizontalcheck = DetermineWinner(game(ii, jj), ...
                game(ii, (jj+1)), game(ii, (jj+2)), game(ii, (jj+3)));
            if minihorizontalcheck == 3
                horizontalCheck = 3;
                if game(ii, jj) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'r')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',22)
                    homepage(msg)
                elseif game(ii, jj) == 2
                    player_two_winner_announcement = title('Player Two Wins');
                    set(player_two_winner_announcement, 'color', 'y')
                    set(player_two_winner_announcement,'FontWeight','bold')
                    set(player_two_winner_announcement,'FontSize',22)
                    homepage(msg)
                end
                break
            end
        end
        if horizontalCheck == 3
            homepage(msg)
            break
            
        end
 
    end
%two nested for loops that iterate to check for a horizontal win from
%either player
%iterating through rows 1:6 and columns 1:4 looking for a match between rows where
%there are four chips in a row from either player

%driver: sophie debuggers: ashley and jess

%% Look for win by columns for Players One and Two
    for jjj = 1:7
        for iii = 1:3
            miniverticalCheck = DetermineWinner(game(iii, jjj), ...
                game((iii+1), jjj), game((iii+2), jjj), game((iii+3), jjj));
            if miniverticalCheck == 3
                verticalCheck = 3;
                if game(iii, jjj) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'r')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                elseif game(iii, jjj) == 2
                    player_two_winner_announcement = title('Player Two Wins');
                    set(player_two_winner_announcement, 'color', 'y')
                    set(player_two_winner_announcement,'FontWeight','bold')
                    set(player_two_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if verticalCheck == 3
            homepage(msg)
            break
        end
    end
%two nested for loops that iterate to check for a vertical win from both
%players
%iterating through columns 1:7 and rows 1:3 looking for a match between columns where
%there are four chips in a row from either player

%driver: sophie debuggers: ashley and jess

%% Look for a win diagonally (right to left) for Players One and Two
    for hh = 1:4
        for tt = 1:3
            minidiagonalCheckRL = DetermineWinner(game(tt, hh), ...
                game((tt+1), (hh+1)), game((tt+2), (hh+2)), ...
                game((tt+3), (hh+3)));
            if minidiagonalCheckRL == 3
                diagonalCheckLR = 3;
                if game(tt, hh) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'r')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                elseif game(tt,hh) == 2
                    player_two_winner_announcement = title('Player Two Wins');
                    set(player_two_winner_announcement, 'color', 'y')
                    set(player_two_winner_announcement,'FontWeight','bold')
                    set(player_two_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if diagonalCheckRL == 3
            break
        end
    end
%two nested for loops that iterate to check for a diagonal win right to
%left for both player one and player two 
%iterating through rows 1:4 and columns 1:3 looking for a match diagonally
%where there are four chips in a row from a player

%driver: jess debuggers: ashley and sophie

%% Look for a win diagonally (left to right) for Players One and Two
    for hhh = 7:-1:4
        for ttt = 1:3
            minidiagonalCheckLR = DetermineWinner(game(ttt, hhh), ...
                game((ttt+1), (hhh-1)), game((ttt+2), (hhh-2)), ...
                game((ttt+3), (hhh-3)));
            if minidiagonalCheckLR == 3
                diagonalCheckLR = 3;
                if game(ttt, hhh) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'r')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                elseif game(ttt, hhh) == 2
                    player_two_winner_announcement = title('Player Two Wins');
                    set(player_two_winner_announcement, 'color', 'y')
                    set(player_two_winner_announcement,'FontWeight','bold')
                    set(player_two_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if diagonalCheckLR == 3
            break
        end
    end

%two nested for loops that iterate to check for a diagonal win left to
%right for both player one and player two 
%iterating through rows 7:4 and columns 1:3 looking for a match diagonally
%where there are four chips in a row from a player

%driver: jess debuggers: ashley and sophie
  
%% Switching Turns
if whos_turn==1
    whos_turn=2;
elseif whos_turn==2
    whos_turn=1;
end
%this if statement allows the player turns to switch off within each of the for
%loops (if player one is going, the next turn will be player two)

%drivers and debuggers: ashley, jess, sophie

end
end

%% Displays Chips 
function [dx, dy] = disp_chip(row, column) %To display the recent move.
               % for row 6
        if row == 6 && column == 1
            dx = 0; dy = 0;
        elseif row == 6 && column == 2
            dx = 1; dy = 0;
        elseif row == 6 && column == 3
            dx = 2; dy = 0;
        elseif row == 6 && column == 4
            dx = 3; dy = 0;
        elseif row == 6 && column == 5
            dx = 4; dy = 0;
        elseif row == 6 && column == 6
            dx = 5; dy = 0;
        elseif row == 6 && column == 7
            dx = 6; dy = 0;
            % for row 5
        elseif row == 5 && column == 1
            dx = 0; dy = 1;
        elseif row == 5 && column == 2
            dx = 1; dy = 1;
        elseif row == 5 && column == 3
            dx = 2; dy = 1;
        elseif row == 5 && column == 4
            dx = 3; dy = 1;
        elseif row == 5 && column == 5
            dx = 4; dy = 1;
        elseif row == 5 && column == 6
            dx = 5; dy = 1;
        elseif row == 5 && column == 7
            dx = 6; dy = 1;
            % for row 4
        elseif row == 4 && column == 1
            dx = 0; dy = 2;
        elseif row == 4 && column == 2
            dx = 1; dy = 2;
        elseif row == 4 && column == 3
            dx = 2; dy = 2;
        elseif row == 4 && column == 4
            dx = 3; dy = 2;
        elseif row == 4 && column == 5
            dx = 4; dy = 2;
        elseif row == 4 && column == 6
            dx = 5; dy = 2;
        elseif row == 4 && column == 7
            dx = 6; dy = 2;
            % for row 3
        elseif row == 3 && column == 1
            dx = 0; dy = 3;
        elseif row == 3 && column == 2
            dx = 1; dy = 3;
        elseif row == 3 && column == 3
            dx = 2; dy = 3;
        elseif row == 3 && column == 4
            dx = 3; dy = 3;
        elseif row == 3 && column == 5
            dx = 4; dy = 3;
        elseif row == 3 && column == 6
            dx = 5; dy = 3;
        elseif row == 3 && column == 7
            dx = 6; dy = 3;
            % for row 2
        elseif row == 2 && column == 1
            dx = 0; dy = 4;
        elseif row == 2 && column == 2
            dx = 1; dy = 4;
        elseif row == 2 && column == 3
            dx = 2; dy = 4;
        elseif row == 2 && column == 4
            dx = 3; dy = 4;
        elseif row == 2 && column == 5
            dx = 4; dy = 4;
        elseif row == 2 && column == 6
            dx = 5; dy = 4;
        elseif row == 2 && column == 7
            dx = 6; dy = 4;
            % for row 1
        elseif row == 1 && column == 1
            dx = 0; dy = 5;
        elseif row == 1 && column == 2
            dx = 1; dy = 5;
        elseif row == 1 && column == 3
            dx = 2; dy = 5;
        elseif row == 1 && column == 4
            dx = 3; dy = 5;
        elseif row == 1 && column == 5
            dx = 4; dy = 5;
        elseif row == 1 && column == 6
            dx = 5; dy = 5;
        elseif row == 1 && column == 7
            dx = 6; dy = 5;
        end
end

%this section of code uses if/elseif statements to display the chips in
%their appropriate locations

%drivers and debuggers: ashley, jess, sophie

%% Function that defines check function used previously to determine wins  
function [winner] = DetermineWinner(HorizontalInput, VerticalInput, DiagonalInputLR, DiagonalInputRL)
         if (HorizontalInput == 1 && VerticalInput == 1 && ...
                 DiagonalInputLR == 1 && DiagonalInputRL == 1) ||...
                 (HorizontalInput == 2 && VerticalInput == 2 && ...
                 DiagonalInputLR == 2 && DiagonalInputRL == 2)
             winner = 3;
             return
         else
             winner = 0;
             return
         end
 end
% the function check takes in four inputs (HorizontalInput, VerticalInput, 
% DiagonalInputLR, DiagonalInputRL) which are the four different winning 
% possibiliiters (by rows, columns, right-left,left-right) and produces an output, 
% "winner" which is the end of the game if winner=3, someone won the game --> if winner=0, 
% no one won the game. The if statement above says that if any one of the four winning 
% conditions is satisfied by either a one or a two (player one or player two), 
% that player has won and winner=3. If not, there is no winner and
% winner=0.

%drivers and debuggers: ashley, jess, sophie
