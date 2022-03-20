function dummy = connect4()
%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%game on zeros

<<<<<<< HEAD
%imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
=======
imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])

game = zeros(6, 7);
horizontalCheck = 0; % checks for horizontal winner
verticalCheck = 0; % checks for vertical winner
diagonalCheckRL = 0; % checks for diagonal winner (right to left)
diagonalCheckLR = 0; % checks for diagonal winner (left to right)
r_sel = 0; % row select for 'game' matrix
turn = 42; % max turns

while (turn ~= 0) & (horizontalCheck == 0) & (verticalCheck == 0) & (diagonalCheckLR == 0) & (diagonalCheckRL == 0)
    

>>>>>>> 66b95f6413be2592e2c1d3e9c0363612dd0a465a
