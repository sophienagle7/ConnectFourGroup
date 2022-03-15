random_matrix_to_assign = randi((10),[6,6]);
vec_A = [0 1 1 1 1 0];
vec_B = [0 0 0 0 0 0];
random_matrix_to_assign((1),:) = vec_B;
random_matrix_to_assign((2),:) = vec_A;
random_matrix_to_assign((3),:) = vec_A;
random_matrix_to_assign((4),:) = vec_A;
random_matrix_to_assign((5),:) = vec_A;
random_matrix_to_assign((6),:) = vec_B;


the_mat2 = repmat(random_matrix_to_assign,6,7);
inverted_the_mat2 = not(the_mat2);


imagesc(inverted_the_mat2)
axis off

