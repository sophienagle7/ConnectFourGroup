function [q] = check(b1, b2, b3, b4)
        if (b1 == 1 && b2 == 1 && b3 == 1 && b4 == 1) || (b1 == 2 && b2 == 2 && b3 == 2 && b4 == 2)
            q = 3;
            return
        else
            q = 0;
            return
        end
end

