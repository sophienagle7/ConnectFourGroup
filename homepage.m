%I = imread('images/HomePage.png');
%imshow(I)

%ginput
% coordinates for ConnectFour box
%ans =
%318.0000  290.0000
%318.0000  340.0000
%618.0000  338.0000
%622.0000  288.0000

%coordinates for TicTac Toe box
%ans =
%320.0000  358.0000
%318.0000  406.0000
%622.0000  360.0000
%624.0000  410.0000

msg = "Choose The Game You Would Like To Play";
opts = ["Connect Four" "Tic-Tac-Toe"];
choice = menu(msg,opts);

%[x, y] = myginput(1,'crosshair'); 



