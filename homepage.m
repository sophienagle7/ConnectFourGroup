function choice = homepage(msg) 
msg = "Welcome! Please Select The Game You Would Like To Play.";
opts = ["Connect Four" "Tic-Tac-Toe" "No game! I just want to look at a picture of dogs! :)"];

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 18);
choice = menu(msg,opts);
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);

%menu function in matlab creating a homescreen that allows the player to
%select which option they want to pursue bu clicking on the appropriate box

if choice == 1
    ConnectFour_Final()
elseif choice == 2
    TicTacToeGame()
elseif choice == 3
    DogsPictures()


end
end

% we then used an if statement that works in tandem with the menu function.
% We identified each of the three options as choices 1, 2, and 3. We then
% incorporated this knowledge into the if statement to direct the menu
% function to other scropts within the folder so that when the player
% selects the option they want, they are taken to the appropriate script. 

%We originally intended to change the colors of the menu page to
%personalize it, but after extensice research and attempts we found that
%this was not possible with the menu fucntion in matlab. Thus, to spice up
%our project in another way, we added another option to our script that
%enables the user to look at a picture of cute dogs when clicked on



%driver: Ashley debuggers: Sophie and Jess
