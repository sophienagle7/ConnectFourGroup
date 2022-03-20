fprintf ('**************************************************\n')
fprintf ('**************************************************\n')
fprintf ('\n*********** WELCOME TO CONNECT FOUR ************\n')
fprintf ('\n************************************************\n')
fprintf ('**************************************************\n')
%Board and chips are loaded
load Connect
imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}]);
%Creates a vector for the number of chips in a row
row=zeros(1,7);
%Matrix of board
connect=[0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0]
win=1;
while win==1
% P1 input
fprintf('Player 1, select a column to place your chip in.\n')
x1 = input('Select a column 1-7:');
Board{6-row(x1),x1}=redchip;
connect(6-row(x1),x1)=1
row(x1)=row(x1)+1;
 imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}]);
%Check Horizontal win
%Check Verical win 
% P2 input
fprintf('Player 2, select a column to place your chip in.\n')
x2 = input('Select a column 1-7:');
Board{6-row(x2),x2}=blackchip;
row(x2)=row(x2)+1;
connect(6-row(x1),x1)=2
imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}]);
% Check horizontal win
% Check vertical win
% Checking diagonal win
end
