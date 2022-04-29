%% NEW SECTION TWO -- UNDERSTAND BETTER AND WORK WITH 
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