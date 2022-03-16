
%create a function (for now using generic input/output names)
function output_variable = connect_four(input_variable)

%Use a matrix to create the playing board
random_matrix_to_assign = randi((10),[6,6]);
vec_A = [0 1 1 1 1 0];
vec_B = [0 0 0 0 0 0];
random_matrix_to_assign((1),:) = vec_B;
random_matrix_to_assign((2),:) = vec_A;
random_matrix_to_assign((3),:) = vec_A;
random_matrix_to_assign((4),:) = vec_A;
random_matrix_to_assign((5),:) = vec_A;
random_matrix_to_assign((6),:) = vec_A;
random_matrix_to_assign((7),:) = vec_B;


the_mat2 = repmat(random_matrix_to_assign,6,7);
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