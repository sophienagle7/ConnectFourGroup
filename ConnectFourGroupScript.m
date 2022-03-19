
%create a function (for now using generic input/output names)
function output_variable = connect_four(input_variable)

%Use a matrix to create the playing board
Board = randi((10),[6,6]);
vec_A = [0 1 1 1 1 0];
vec_B = [0 0 0 0 0 0];
Board((1),:) = vec_B;
Board((2),:) = vec_A;
Board((3),:) = vec_A;
Board((4),:) = vec_A;
Board((5),:) = vec_A;
Board((6),:) = vec_A;
Board((7),:) = vec_B;


the_mat2 = repmat(Board,6,7);
inverted_the_mat2 = not(the_mat2);


imagesc(inverted_the_mat2)
axis off

%using a function to create playing chips
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


function circles2 = circle2(x,y,r,c)
hold on
th = 0:pi/50:2*pi;
x_circle2 = r * cos(th) + x;
y_circle = r * sin(th) + y;
circles2 = plot(x_circle2, y_circle2);
fill(x_circle2, y_circle2, c)
hold off
axis equal
end
circleout = circle(3, 4, 2, 'y')



end

%% Assign Players

player_1 == 1; %assign player 1
player_2 == 2; %assign player 2
result = 0; %define result variable
if result == 1
    fprintf("Player 1 Wins")
elseif result == 2
    fprintf('Player 2 Wins')
else
    fprintf('Draw')
end

end

%% Board Logic

function result = BoardEvaluation(Board)
result = 0;
%Check for any winner Horizontally
for row = Board()
    for column = Board()
        fourinrow = (row, column:(column + 3));
        if fourinrow == 1
            result = 1;
            break;
        elseif fourinrow == 2
            result = 2;
            break;
        end
    end
end
% Check winner Vertically
if ~result 
    for row = 
        for column = 
            fourinrowcol = (row:(row+3), column);
            if fourinrowcol == 1
                result = 1;
                break
            elseif fourinrowcol == 2
                result = 2;
                break
            end
        end
    end
end
%Check winner horizontally
if ~result 
    for row = 
        for column = 
            diagonalwinner = [board(row, column), board(row + 1, column + 1), board(row + 2, column + 2), board(row + 3, column + 3)];
            if diagonal winner == 1
                result = 1;
                break
            elseif diagnoal winner == 2
                result = 2;
                break;
            end
        end
    end
end

%Check diagnoal other direction 
if diagonal == 1
    result = 1;
    break;
elseif [board(7-row, col), board(6-row, col + 1), board(5 - row, col + 2), board(4-row, col + 3)] == 2
          

end
end