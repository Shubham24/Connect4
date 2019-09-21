% clear command window and workspace
clear;
clc;
% load Connect.mat file
load Connect.mat;
% print instructions
fprintf('Instructions:\nChoose a slot [1 - 7] to place your chip!\nFirst player to get four chips in a row (horizontally, vertically, or diagonally wins!)\nHave Fun!\n\n');
% show empty board
imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
% initialize color (1: Player 1 (red)   2: Player 2 (black))
color = 1;
% create a 6 x 7 matrix of 0's corresponding to the board
board  = zeros(6,7);
% set win to false
win = false;
% while win is equal to false
while(win == 0)
    % if color is equal to 1, meaning it's Player 1's turn
    if color == 1
    slot = input('Player 1: What slot would you like to place your chip (1 - 7) : '); % ask Player 1 to input where they would like to place their chip and store that value in variable slot
    % while the slot does contain exactly 1 answer, OR is greater than
    % OR is less than 1
    while length(slot) ~= 1 || slot > 7 || slot < 1
         slot = input('ERROR: Player 1: What slot would you like to place your chip (1 - 7): '); % display error message and reprompt user to input where they would like to place their chip
    end
    % while the column (slot) is full
    % meaning row one of the given column is not equal to 0
    while board(1, slot) ~= 0
        slot = input('ERROR: Player 1: SLOT IS FULL! Pick another slot (1 - 7): '); % Give an error message, and reprompt user to input where they want to place their chip
    end
    end
    
    % if color is equal to 2 meaning it's Player 2's turn
    if color == 2
        slot = input('Player 2: What slot would you like to place your chip (1 - 7): '); % ask Player 2 to input where they would like to place their chip and store that value in variable slot
     while length(slot) ~= 1 || slot > 7 || slot < 1
        slot = input('ERROR: Player 2: What slot would you like to place your chip (1 - 7): '); % display error message and reprompt user to input where they would like to place their chip
     end
     
    % while the column (slot) is full
    % meaning row one of the given column is not equal to 0 
    while board(1, slot) ~= 0
            slot = input('ERROR: Player 2: SLOT IS FULL! Pick another slot (1 - 7): '); % Give an error message, and reprompt user to input where they want to place their chip
    end
    
    end
    
    % for loop that starts at the last row (row 6) 
    % and iterates a row up until it gets to the very first row (row 1)
    % checks for the lowest available place to place chip
    for i = length(board) - 1:-1:1
        % if board at row i and column slot is equal to 0
        if board(i, slot) == 0
            % if it is Player 1's turn
            if color == 1
                board(i, slot) = 1; % set the value of board at row i and column slot to 1
                Board{i,slot} = redchip; % place a redchip on Board at row i and column slot
                win = checkwin(board(i,:), board(:,slot), board); % check win status by calling the checkwin() funtion
                % if win is equal to 1
                if win == 1
                    fprintf('Player 1: You Won!!!'); % print "Player 1: You Won!!!"
                % if win is equal to 2
                elseif win == 2
                    fprintf('Draw!!!'); % print "Draw!!!"
                end
                color = 2; % set color value to 2 - Giving Player 2 a turn
                break; % stop the loop immediately
            
            % if color is equal to 2
            else
                board(i, slot) = 2; % set board at row i column slot to 2
                Board{i, slot} = blackchip; % place a black chip on Board at row i, column slot
                win = checkwin(board(i,:), board(:,slot), board); % check win status by calling the checkwin() funtion
                % if win is equal to 1
                if win == 1
                    fprintf('Player 2: You Won!!!'); % print "Player 2: You Won!!!"
       
                % if win is equal to 2
                elseif win == 2
                    fprintf('Draw!!!'); % print "Draw!!!"
                end
                color = 1; % set color value to 1 - Giving Player 1 a turn
                break; % stop the loop immediately
            end
        end
    end
    imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}]); % show all of Board
end


