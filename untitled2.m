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