function dummy = connect4()
%%%%%%%%%%%%%%%%%%%%%%%%%%%
row_0 = [0, 7]; hy0 = [0, 0];
row_1 = [0, 7]; hy1 = [1, 1];
row_2 = [0, 7]; hy2 = [2, 2];
row_3 = [0, 7]; hy3 = [3, 3];
row_4 = [0, 7]; hy4 = [4, 4];
row_5 = [0, 7]; hy5 = [5, 5];
row_6 = [0, 7]; hy6 = [6, 6];
column_0 = [0, 0]; vy0 = [0, 6];
column_1 = [1, 1]; vy1 = [0, 6];
column_2 = [2, 2]; vy2 = [0, 6];
column_3 = [3, 3]; vy3 = [0, 6];
column_4 = [4, 4]; vy4 = [0, 6];
column_5 = [5, 5]; vy5 = [0, 6];
column_6 = [6, 6]; vy6 = [0, 6];
column_7 = [7, 7]; vy7 = [0, 6];
clf
plot(hx0, hy0, 'b', hx1, hy1, 'b', hx2, hy2, 'b', hx3, hy3, 'b', hx4, hy4, 'b', hx5, hy5, 'b', hx6, hy6, 'b', ...
    vx0, vy0, 'b', vx1, vy1, 'b', vx2, vy2, 'b', vx3, vy3, 'b', vx4, vy4, 'b', vx5, vy5, 'b', vx6, vy6, 'b', ...
    vx7, vy7, 'b')
axis off, axis square, ...
     set(gcf, 'color', [0.20000 0.7450 0.9220])
pause(2)

game on zeros

imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])