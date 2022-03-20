row =1;
while row+1 <= 6
        if game((row+1), ceil(x)) == 1 || game((row+1), ceil(x)) == 2
            r_sel = row;
            break
        elseif row <= 6
            r_sel = row + 1;
        end
        row = row+1;
    end