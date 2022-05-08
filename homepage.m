msg = "Welcome! Please Select The Game You Would Like To Play.";
opts = ["Connect Four" "Tic-Tac-Toe" "No game! I just want to look at a picture of dogs! :)"];

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 18);
choice = menu(msg,opts);
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);

if choice == 1
    ConnectFour_Final()
elseif choice == 2
    TicTacToeGame()
elseif choice == 3
    DogsPictures()


end




