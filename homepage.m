msg = "Choose The Game You Would Like To Play";
opts = ["Connect Four" "Tic-Tac-Toe"];

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 18);
choice = menu(msg,opts);
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);

if choice == 1
    ConnectFour_Final()
elseif choice == 2
    gameSetup()

end
%[x, y] = myginput(1,'crosshair'); 


