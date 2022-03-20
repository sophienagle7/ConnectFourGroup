function dummy = connect4()
%%%%%%%%%%%%%%%%%%%%%%%%%%%
hx0 = [0, 7]; hy0 = [0, 0];
hx1 = [0, 7]; hy1 = [1, 1];
hx2 = [0, 7]; hy2 = [2, 2];
hx3 = [0, 7]; hy3 = [3, 3];
hx4 = [0, 7]; hy4 = [4, 4];
hx5 = [0, 7]; hy5 = [5, 5];
hx6 = [0, 7]; hy6 = [6, 6];
vx0 = [0, 0]; vy0 = [0, 6];
vx1 = [1, 1]; vy1 = [0, 6];
vx2 = [2, 2]; vy2 = [0, 6];
vx3 = [3, 3]; vy3 = [0, 6];
vx4 = [4, 4]; vy4 = [0, 6];
vx5 = [5, 5]; vy5 = [0, 6];
vx6 = [6, 6]; vy6 = [0, 6];
vx7 = [7, 7]; vy7 = [0, 6];
clf
plot(hx0, hy0, 'g', hx1, hy1, 'r', hx2, hy2, 'r', hx3, hy3, 'r', hx4, hy4, 'r', hx5, hy5, 'r', hx6, hy6, 'r', ...
    vx0, vy0, 'r', vx1, vy1, 'r', vx2, vy2, 'r', vx3, vy3, 'r', vx4, vy4, 'r', vx5, vy5, 'r', vx6, vy6, 'r', ...
    vx7, vy7, 'r')
axis off, axis square, ...
    set(gcf, 'color', [0 0 0])
pause(2)
hold
game = zeros(6, 7);
l = 0; % Used in linewise cheking of winner
g = 0; % Used in columnwise checking of winner
s = 0; % Used in Diagonally(\) cheking of winner
a = 0; % Used in Diagonally(/) checking of winner
outc = 0; % Output of r_number; column select for computer's turn
r_sel = 0; % row select for 'game' matrix
turn = 42; % Total turns that can be played
while (turn ~= 0) & (l == 0) & (g == 0) & (s == 0) & (a == 0)
    %%%% Human Turn %%%%
    ti = title('Place the cursor on the top of the desired column, then click.');
    set(ti, 'color', 'b')
    set(ti,'FontWeight','bold')
    set(ti,'FontSize',19)
    [x, y] = ginput(1);
    turn = turn-1;
    row = 1;
    while row+1 <= 6
        if game((row+1), ceil(x)) == 1 | game((row+1), ceil(x)) == 2
            r_sel = row;
            break
        elseif row <= 6
            r_sel = row + 1;
        end
        row = row+1;
    end
    game(r_sel, ceil(x)) = 1;
    [dx, dy] = bdisp(r_sel, ceil(x));
    te = text(dx+0.5, dy+0.5, 'H', ...
        'fontsize', 20, 'horizontalalignment', 'center');
    set(te, 'color', 'm')
    %%%% Check for win linewise %%%%
    for li = 1:6
        for col = 1:4
            l = ashley(game(li, col), game(li, (col+1)), game(li, (col+2)), game(li, (col+3)));
            if l == 3
                if game(li, col) == 1
                    ti2 = title('Human Player Wins !!!  (Press any key for new game)');
                    set(ti2, 'color', 'm')
                    set(ti2,'FontWeight','bold')
                    set(ti2,'FontSize',19)
                end
                break
            end
        end
        if l == 3
            break
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Check for win columnwise %%%%
    for coll = 1:7
        for lii = 1:3
            g = ashley(game(lii, coll), game((lii+1), coll), game((lii+2), coll), game((lii+3), coll));
            if g == 3
                if game(lii, coll) == 1
                    ti2 = title('Human Player Wins !!!  (Press any key for new game)');
                    set(ti2, 'color', 'm')
                    set(ti2,'FontWeight','bold')
                    set(ti2,'FontSize',19)
                end
                break
            end
        end
        if g == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Check for win Diagonally (\) %%%%
    for cold1 = 1:4
        for rowd1 = 1:3
            s = ashley(game(rowd1, cold1), game((rowd1+1), (cold1+1)), game((rowd1+2), (cold1+2)), game((rowd1+3), (cold1+3)));
            if s == 3
                if game(rowd1, cold1) == 1
                    ti2 = title('Human Player Wins !!!  (Press any key for new game)')
                    set(ti2, 'color', 'm')
                    set(ti2,'FontWeight','bold')
                    set(ti2,'FontSize',19)
                end
                break
            end
        end
        if s == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Check for win Diagonally (/) %%%%
    for cold2 = 7:-1:4
        for rowd2 = 1:3
            a = ashley(game(rowd2, cold2), game((rowd2+1), (cold2-1)), game((rowd2+2), (cold2-2)), game((rowd2+3), (cold2-3)));
            if a == 3
                if game(rowd2, cold2) == 1
                    ti2 = title('Human Player Wins !!!  (Press any key for new game)')
                    set(ti2, 'color', 'm')
                    set(ti2,'FontWeight','bold')
                    set(ti2,'FontSize',19)
                end
                break
            end
        end
        if a == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% End of Human Turn %%%%
    if (l ~= 0) | (g ~= 0) | (s ~= 0) | (a ~= 0)
        break
    end
    %%%% Computer play %%%%
    pause(.1)
    outc = r_number();
    counter = 0;
    row = 1;
    while row+1 <= 6
        if game(row, ceil(outc)) == 1 | game(row, ceil(outc)) == 2
            outc = r_number();
            row = 5;
        elseif game((row+1), ceil(outc)) == 1 | game((row+1), ceil(outc)) == 2
            r_sel = row;
            break
        elseif row <= 6
            r_sel = row + 1;
        end
        row = row+1;
    end
    game(r_sel, ceil(outc)) = 2;
    [dx, dy] = bdisp(r_sel, ceil(outc));
    te = text(dx+0.5, dy+0.5, 'C', ...
        'fontsize', 20, 'horizontalalignment', 'center');
    set(te, 'color', 'y')
    turn = turn-1;
    %%%% Check for win linewise %%%%
    for li = 1:6
        for col = 1:4
            l = ashley(game(li, col), game(li, (col+1)), game(li, (col+2)), game(li, (col+3)));
            if l == 3
                if game(li, col) == 2
                    ti3 = title('Computer Player Wins !!!  (Press any key for new game)');
                    set(ti3, 'color', 'y')
                    set(ti3,'FontWeight','bold')
                    set(ti3,'FontSize',19)
                end
                break
            end
        end
        if l == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Check for win columnwise %%%%
    for coll = 1:7
        for lii = 1:3
            g = ashley(game(lii, coll), game((lii+1), coll), game((lii+2), coll), game((lii+3), coll));
            if g == 3
                if game(lii, coll) == 2
                    ti3 = title('Computer Player Wins !!!  (Press any key for new game)');
                    set(ti3, 'color', 'y')
                    set(ti3,'FontWeight','bold')
                    set(ti3,'FontSize',19)
                end
                break
            end
        end
        if g == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Check for win Diagonally (\) %%%%
    for cold1 = 1:4
        for rowd1 = 1:3
            s = ashley(game(rowd1, cold1), game((rowd1+1), (cold1+1)), game((rowd1+2), (cold1+2)), game((rowd1+3), (cold1+3)));
            if s == 3
                if game(rowd1, cold1) == 2
                    ti3 = title('Computer Player Wins !!!  (Press any key for new game)');
                    set(ti3, 'color', 'y')
                    set(ti3,'FontWeight','bold')
                    set(ti3,'FontSize',19)
                end
                break
            end
        end
        if s == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Check for win Diagonally (/) %%%%
    for cold2 = 7:-1:4
        for rowd2 = 1:3
            a = ashley(game(rowd2, cold2), game((rowd2+1), (cold2-1)), game((rowd2+2), (cold2-2)), game((rowd2+3), (cold2-3)));
            if a == 3
                if game(rowd2, cold2) == 2
                    ti3 = title('Computer Player Wins !!!  (Press any key for new game)');
                    set(ti3, 'color', 'y')
                    set(ti3,'FontWeight','bold')
                    set(ti3,'FontSize',19)
                end
                break
            end
        end
        if a == 3
            break
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% End of Computer Turn %%%%
end
if turn == 0
    ti4 = title('Game Draw :(');
    set(ti3, 'color', 'c')
    set(ti3,'FontWeight','bold')
    set(ti3,'FontSize',19)
end
pause
connect4()
hold
%%%%%%%%%%%%%%%%%%%%%%%%%%
    function [q] = ashley(b1, b2, b3, b4);
        if (b1 == 1 & b2 == 1 & b3 == 1 & b4 == 1) | (b1 == 2 & b2 == 2 & b3 == 2 & b4 == 2)
            q = 3;
            return
        else
            q = 0;
            return
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function out = r_number(); % Random column select for computer turn.
        out = round(6*rand(1, 1) + 1);
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function [dx, dy] = bdisp(r, c); %To display the recent move.
        % for row 6
        if r == 6 & c == 1
            dx = 0; dy = 0;
        elseif r == 6 & c == 2
            dx = 1; dy = 0;
        elseif r == 6 & c == 3
            dx = 2; dy = 0;
        elseif r == 6 & c == 4
            dx = 3; dy = 0;
        elseif r == 6 & c == 5
            dx = 4; dy = 0;
        elseif r == 6 & c == 6
            dx = 5; dy = 0;
        elseif r == 6 & c == 7
            dx = 6; dy = 0;
            % for row 5
        elseif r == 5 & c == 1
            dx = 0; dy = 1;
        elseif r == 5 & c == 2
            dx = 1; dy = 1;
        elseif r == 5 & c == 3
            dx = 2; dy = 1;
        elseif r == 5 & c == 4
            dx = 3; dy = 1;
        elseif r == 5 & c == 5
            dx = 4; dy = 1;
        elseif r == 5 & c == 6
            dx = 5; dy = 1;
        elseif r == 5 & c == 7
            dx = 6; dy = 1;
            % for row 4
        elseif r == 4 & c == 1
            dx = 0; dy = 2;
        elseif r == 4 & c == 2
            dx = 1; dy = 2;
        elseif r == 4 & c == 3
            dx = 2; dy = 2;
        elseif r == 4 & c == 4
            dx = 3; dy = 2;
        elseif r == 4 & c == 5
            dx = 4; dy = 2;
        elseif r == 4 & c == 6
            dx = 5; dy = 2;
        elseif r == 4 & c == 7
            dx = 6; dy = 2;
            % for row 3
        elseif r == 3 & c == 1
            dx = 0; dy = 3;
        elseif r == 3 & c == 2
            dx = 1; dy = 3;
        elseif r == 3 & c == 3
            dx = 2; dy = 3;
        elseif r == 3 & c == 4
            dx = 3; dy = 3;
        elseif r == 3 & c == 5
            dx = 4; dy = 3;
        elseif r == 3 & c == 6
            dx = 5; dy = 3;
        elseif r == 3 & c == 7
            dx = 6; dy = 3;
            % for row 2
        elseif r == 2 & c == 1
            dx = 0; dy = 4;
        elseif r == 2 & c == 2
            dx = 1; dy = 4;
        elseif r == 2 & c == 3
            dx = 2; dy = 4;
        elseif r == 2 & c == 4
            dx = 3; dy = 4;
        elseif r == 2 & c == 5
            dx = 4; dy = 4;
        elseif r == 2 & c == 6
            dx = 5; dy = 4;
        elseif r == 2 & c == 7
            dx = 6; dy = 4;
            % for row 1
        elseif r == 1 & c == 1
            dx = 0; dy = 5;
        elseif r == 1 & c == 2
            dx = 1; dy = 5;
        elseif r == 1 & c == 3
            dx = 2; dy = 5;
        elseif r == 1 & c == 4
            dx = 3; dy = 5;
        elseif r == 1 & c == 5
            dx = 4; dy = 5;
        elseif r == 1 & c == 6
            dx = 5; dy = 5;
        elseif r == 1 & c == 7
            dx = 6; dy = 5;
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end