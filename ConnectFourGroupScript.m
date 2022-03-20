
%create a function (for now using generic input/output names)
function output_variable = connect_four(input_variable)

%Use a matrix to create the playing board
Board_Int = randi((10),[6,6]);
vec_A = [0 1 1 1 1 0];
vec_B = [0 0 0 0 0 0];
Board_Int((1),:) = vec_B;
Board_Int((2),:) = vec_A;
Board_Int((3),:) = vec_A;
Board_Int((4),:) = vec_A;
Board_Int((5),:) = vec_A;
Board_Int((6),:) = vec_A;
Board_Int((7),:) = vec_B;


<<<<<<< Updated upstream
the_mat2 = repmat(Board_Int,6,7);
Board = not(the_mat2);


imagesc(Board)
=======
the_mat2 = repmat(random_matrix_to_assign,6,7);
%inverted_the_mat2 = not(the_mat2);


imagesc(the_mat2)
>>>>>>> Stashed changes
axis off

%using a function to create playing chips
    %RED CHIP
function circles = circle(x,y,r,c)
hold on
th = 0:pi/50:2*pi;
x_circle = r * cos(th) + x;
y_circle = r * sin(th) + y;
circles = plot(x_circle, y_circle);
fill(x_circle, y_circle, c)
hold off
axis equal
end
circleout = circle(3, 4, 2, 'r') 

    %YELLOW CHIP

function circles2 = circle2(x,y,r,c)
hold on
th = 0:pi/50:2*pi;
x_circle2 = r * cos(th) + x;
y_circle2 = r * sin(th) + y;
circles2 = plot(x_circle2, y_circle2);
fill(x_circle2, y_circle2, c)
hold off
axis equal
end
<<<<<<< Updated upstream
circleout2 = circle2(3, 4, 2, 'y')
=======
circleout2 = circle2(3, 4, 2, 'y') 


>>>>>>> Stashed changes




%% Assign Players

player1 == 1; %assign player 1
player2 == 2; %assign player 2
result = 0; %define result variable
player = 0 %determines which players turn

% Alternate player turns 
while ~result 
    if player == 1
        player = 1;
    else player == 2
        player = 2;
    end
end

if result == 1
    fprintf("Player 1 Wins")
elseif result == 2
    fprintf('Player 2 Wins')
else
    fprintf('Draw')
end


%% Board Logic
 
% define rows and columns
row1 = Board(2:6, :);
row2 = Board(9:13, :);
row3 = Board(16:20, :);
row4 = Board(23:27, :);
row5 = Board(30:34, :);
row6 = Board(37:41, :);
% 
% %these are the rows that contain the squares ie col1 is the first section
% %of columns containing 0s that would have chips
% 
% col1 = board(:, 2:5);
% col2 = board(:, 8:11);
% col3 = board(:, 14:17);
% col4 = board(:, 20:23);
% col5 = board(:, 26:29);
% col6 = board(:, 32:35);
% col7 = board(:, 38:41);
% 
% 
% function result = BoardEvaluation(Board)
% result = 0;
% %Check for any winner Horizontally
% for row1:row6
%     for column = Board()
%         fourinrow = (row, column:(column + 3));
%         if fourinrow == 1
%             result = 1;
%             break;
%         elseif fourinrow == 2
%             result = 2;
%             break;
%         end
%     end
% end
% % Check winner Vertically
% if ~result 
%     for row1:row3
%             fourinrowcol = (row:(row+3), column);
%             if fourinrowcol == 1
%                 result = 1;
%                 break
%             elseif fourinrowcol == 2
%                 result = 2;
%                 break
%             end
%         end
%     end
% end
% %Check winner Diagonal
% if ~result 
%     for row1:row6
%         for col1:col4
%             diagonalwinner = [board(row, column), board(row + 1, column + 1), board(row + 2, column + 2), board(row + 3, column + 3)];
%             if diagonal winner == 1
%                 result = 1;
%                 break
%             elseif diagnoal winner == 2
%                 result = 2;
%                 break;
%             end
%         end
%     end
% end
% 
% %Check diagnoal other direction 
% if [board(7-row, col), board(6-row, col + 1), board(5 - row, col + 2), board(4-row, col + 3)] == 1
%     result = 1;
%     break;
% elseif [board(7-row, col), board(6-row, col + 1), board(5 - row, col + 2), board(4-row, col + 3)] == 2
%     result = 2;
%     break;
% end
% end
% 
% % check for Draw?
%           
% 
% end
end