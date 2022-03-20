function connect_four_output = connect4()
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
    set(instructions, 'color', 'm')
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
%nearest whole integer
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
   [dx, dy] = bdisp(row_click, ceil(dx));
    player_one_chip = text(dx+0.5, dy+0.5, 'O', ...
        'fontsize', 20, 'horizontalalignment', 'center');
    set(player_one_chip, 'color', 'm')
%the above code creates the player one chip 

%% Look for win by rows
    for ii = 1:6
        for jj = 1:4
            horizontalcheck = check(game(rows_ii, jj), game(rows_ii, (jj+1)), game(rows_ii, (jj+2)), game(rows_ii, (jj+3)));
            if horizontalcheck == 3
                if game(rows_ii, jj) == 1
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
%% Look for win by columns
    for jjj = 1:7
        for iii = 1:3
            verticalCheck = check(game(iii, jjj), game((iii+1), jjj), game((iii+2), jjj), game((iii+3), jjj));
            if verticalCheck == 3
                if game(iii, jjj) == 1
                    ti2 = title('Player One Wins');
                    set(ti2, 'color', 'm')
                    set(ti2,'FontWeight','bold')
                    set(ti2,'FontSize',19)
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
end