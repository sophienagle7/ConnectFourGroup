function connect_four_output = connect_four_board_mathworks()
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
plot(row_0x, row_0y, 'b', row_1x, row_1y, 'b', row_2x, row_2y, 'b', row_3x, row_3y, 'b', row_4x, row_4y, 'b', row_5x, row_5y, 'b', row_6x, row_6y, 'b', ...
    column_0x, column_0y, 'b', column_1x, column_1y, 'b', column_2x, column_2y, 'b', column_3x, column_3y, 'b', column_4x, column_4y, 'b', column_5x, column_5y, 'b', column_6x, column_6y, 'b', ...
    column_7x, column_7y, 'b')
axis off, axis square, ...
     set(gcf, 'color', [0.20000 0.7450 0.9220])

%creating a gameboard using rows, columns, and plots
%setting color of background and grid to blue

instructions = title('select your chip placement by clicking the top of your chosen column');
    set(instructions, 'color', 'w')
    set(instructions,'FontWeight','bold')
    set(instructions,'FontSize',15)

%setting title for board with instructions on how to play

%% Defining Variables and Setting Game Parameters

game = zeros(6, 7);
horizontalCheck = 0; % checks for horizontal winner
verticalCheck = 0; % checks for vertical winner
diagonalCheckRL = 0; % checks for diagonal winner (right to left)
diagonalCheckLR = 0; % checks for diagonal winner (left to right)
row_click= 0; % row select for 'game' matrix
turn = 42; % max turns that can be played 
while (turn ~= 0) && (horizontalCheck == 0) && (verticalCheck == 0) && (diagonalCheckLR == 0) && (diagonalCheckRL == 0)

%creating gameboard and setting variables that will be used later when
%checking for wins and playing the game
%using while statement to establish when the game should be played or not
% (when there is no win and there are turns left [maximum 42 turns permitted])

%% Player One Turn

    [x, y] = ginput(1);
    turn = turn-1;
    row = 1;
    while row+1 <= 6
        if game((row+1), ceil(x)) == 1 || game((row+1), ceil(x)) == 2 
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
    game(row_click, ceil(x)) = 1;
   [dx, dy] = disp_chip(row_click, ceil(x));
    player_one_chip = text(dx+0.5, dy+0.5, '1', ...
        'fontsize', 20, 'horizontalalignment', 'center');
    set(player_one_chip, 'color', 'm')
%the above code creates the player one chip (which is pink)

%% Look for win by rows for Player One
    for ii = 1:6
        for jj = 1:4
            horizontalcheck = DetermineWinner(game(ii, jj), game(ii, (jj+1)), game(ii, (jj+2)), game(ii, (jj+3)));
            if horizontalcheck == 3
                if game(ii, jj) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'm')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if horizontalcheck == 3
            break
            
        end
 
    end
%two nested for loops that iterate to check for a horizontal win
%iterating through rows 1:6 and columns 1:4 looking for a match between rows where
%there are four chips in a row from player one

%% Look for win by columns for Player One
    for jjj = 1:7
        for iii = 1:3
            verticalCheck = DetermineWinner(game(iii, jjj), game((iii+1), jjj), game((iii+2), jjj), game((iii+3), jjj));
            if verticalCheck == 3
                if game(iii, jjj) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'm')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if verticalCheck == 3
            break
        end
    end
%two nested for loops that iterate to check for a vertical win
%iterating through columns 1:7 and rows 1:3 looking for a match between columns where
%there are four chips in a row from player one

%% Look for a win diagonally (right to left) for Player One
    for hh = 1:4
        for tt = 1:3
            diagonalCheckRL = DetermineWinner(game(tt, hh), game((tt+1), (hh+1)), game((tt+2), (hh+2)), game((tt+3), (hh+3)));
            if diagonalCheckRL == 3
                if game(tt, hh) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'm')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if diagonalCheckRL == 3
            break
        end
    end
%two nested for loops that iterate to check for a diagonal win right to
%left
%iterating through rows 1:4 and columns 1:3 looking for a match diagonally
%where there are four chips in a row from player one

%% Look for a win diagonally (left to right) for Player One
    for hhh = 7:-1:4
        for ttt = 1:3
            diagonalCheckLR = DetermineWinner(game(ttt, hhh), game((ttt+1), (hhh-1)), game((ttt+2), (hhh-2)), game((ttt+3), (hhh-3)));
            if diagonalCheckLR == 3
                if game(ttt, hhh) == 1
                    player_one_winner_announcement = title('Player One Wins');
                    set(player_one_winner_announcement, 'color', 'm')
                    set(player_one_winner_announcement,'FontWeight','bold')
                    set(player_one_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if diagonalCheckLR == 3
            break
        end
    end
%two nested for loops that iterate to check for a diagonal win left to
%right
%iterating through rows backwards from 7:4 and columns 1:3 looking for a match diagonally
%where there are four chips in a row from player one

%% End of Player One Turn
if (horizontalCheck ~= 0) || (verticalCheck ~= 0) || (diagonalCheckRL ~= 0) || (diagonalCheckLR ~= 0)
end
%if any one of the four checks is not zero, it means that that check has
%been fulfilled and Player One has won the game, so the game ends

%% Player Two Turn
    [x, y] = ginput(1);
    turn = turn-1;
    row = 1;
    while row+1 <= 6
        if game((row+1), ceil(x)) == 1 || game((row+1), ceil(x)) == 2  
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
    game(row_click, ceil(x)) = 2;
   [dx, dy] = disp_chip(row_click, ceil(x));
    player_one_chip = text(dx+0.5, dy+0.5, '2', ...
        'fontsize', 20, 'horizontalalignment', 'center');
    set(player_one_chip, 'color', 'y')
%the above code creates the player two chip (which is yellow)

%% Look for win by rows for Player Two
    for ii = 1:6
        for jj = 1:4
            horizontalcheck = DetermineWinner(game(ii, jj), game(ii, (jj+1)), game(ii, (jj+2)), game(ii, (jj+3)));
            if horizontalcheck == 3
                if game(ii, jj) == 2
                    player_two_winner_announcement = title('Player Two Wins');
                    set(player_two_winner_announcement, 'color', 'y')
                    set(player_two_winner_announcement,'FontWeight','bold')
                    set(player_two_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if horizontalcheck == 3
            break
            
        end
 
    end
%two nested for loops that iterate to check for a horizontal win
%iterating through rows 1:6 and columns 1:4 looking for a match between rows where
%there are four chips in a row from player two

%% Look for win by columns for Player Two
    for jjj = 1:7
        for iii = 1:3
            verticalCheck = DetermineWinner(game(iii, jjj), game((iii+1), jjj), game((iii+2), jjj), game((iii+3), jjj));
            if verticalCheck == 3
                if game(iii, jjj) == 2
                    player_two_winner_announcement = title('Player Two Wins');
                    set(player_two_winner_announcement, 'color', 'y')
                    set(player_two_winner_announcement,'FontWeight','bold')
                    set(player_two_winner_announcement,'FontSize',19)
                end
                break
            end
        end
        if verticalCheck == 3
            break
        end
    end
%two nested for loops that iterate to check for a vertical win
%iterating through columns 1:7 and rows 1:3 looking for a match between columns where
%there are four chips in a row from player two

%% Look for a win diagonally (right to left) for Player Two
    for hh = 1:4
        for tt = 1:3
            diagonalCheckRL = DetermineWinner(game(tt, hh), game((tt+1), (hh+1)), game((tt+2), (hh+2)), game((tt+3), (hh+3)));
            if diagonalCheckRL == 3
                if game(tt, hh) == 2
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
%left
%iterating through rows 1:4 and columns 1:3 looking for a match diagonally
%where there are four chips in a row from player two

%% Look for a win diagonally (left to right) for Player Two
    for hhh = 7:-1:4
        for ttt = 1:3
            diagonalCheckLR = DetermineWinner(game(ttt, hhh), game((ttt+1), (hhh-1)), game((ttt+2), (hhh-2)), game((ttt+3), (hhh-3)));
            if diagonalCheckLR == 3
                if game(ttt, hhh) == 2
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
%right
%iterating through rows backwards from 7:4 and columns 1:3 looking for a match diagonally
%where there are four chips in a row from player two

%% End of Player Two Turn
if (horizontalCheck ~= 0) || (verticalCheck ~= 0) || (diagonalCheckRL ~= 0) || (diagonalCheckLR ~= 0)
end

%the function check takes in four inputs (b1, b2, b3, and b4) which are the
%four different winning possibiliiters (rows, columns, right-left,
%left-right) and produces an output, q which is the end of the game
%if q=3, someone won the game --> if q=0, no one won the game. The if
%statement above says that if any one of the four winning conditions is
%satisfied by either a one or a two (player one or player two), that player
%respectivley has won and q=3. If not, there is no winner and q=0
%if any one of the four checks is not zero, it means that that check has
%been fulfilled and Player Two has won the game, so the game ends
end
end

%% NEW SECTION  -- UNDERSTAND BETTER AND WORK WITH 
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

%% Function that defines check function used previously to determine wins  
function [winner] = DetermineWinner(HorizontalInput, VerticalInput, DiagonalInputLR, DiagonalInputRL)
         if (HorizontalInput == 1 && VerticalInput == 1 && DiagonalInputLR == 1 && DiagonalInputRL == 1) || (HorizontalInput == 2 && VerticalInput == 2 && DiagonalInputLR == 2 && DiagonalInputRL == 2)
             winner = 3;
             return
         else
             winner = 0;
             return
         end
 end
% %the function check takes in four inputs (b1, b2, b3, and b4) which are the
% %four different winning possibiliiters (rows, columns, right-left,
% %left-right) and produces an output, q which is the end of the game
% %if q=3, someone won the game --> if q=0, no one won the game. The if
% %statement above says that if any one of the four winning conditions is
% %satisfied by either a one or a two (player one or player two), that player
% %respectivley has won and q=3. If not, there is no winner and q=0
%  