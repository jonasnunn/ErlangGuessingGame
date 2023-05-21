-module(main).
-import(string, [len/1, concat/2, to_lower/1]).
-export([main/0]).

main() ->
    io:fwrite("Welcome to the guessing game.\n"),
    RandNum = gen_rand_num(10),
    game_loop(RandNum).

% The game loop that calls all the other functions
game_loop(RandNum) ->
    UserGuess = get_guess(),
    io:fwrite("Your guess is: ~p Answer: ~p\n", [UserGuess, RandNum]),
    compare(RandNum, UserGuess),
    game_loop(RandNum).

% Generates a random number from 1 to MaxNum
gen_rand_num(MaxNum) ->
    rand:uniform(MaxNum).

% Get the guess, make sure it only has valid characters and then convert it to an integer.
get_guess() ->
    io:fwrite("Enter a guess (1-10): "),
    GuessStr = io:get_line(""),
    Guess = string:strip(GuessStr, right, $\n),
    GuessNum = list_to_integer(Guess),
    GuessNum.
    
% Compare the guess to the answer and tell the user if they were high or low.
compare(RandNum, Guess) ->
    if 
        RandNum > Guess ->
            io:fwrite("Your guess is too low\n");
        RandNum < Guess ->
            io:fwrite("Your guess is too high\n");
        RandNum == Guess ->
            io:fwrite("You guessed it!!!\n"),
            halt(); % Terminate the program.
        true ->
            io:fwrite("Something odd happened.\n")
    end.
