-module(main).

-import(string, [len/1, concat/2, to_lower/1]).

-export([main/0]).

main() ->
    io:fwrite("Welcome to the guessing game.\n"),
    RandNum = gen_rand_num(10),
    UserGuess = get_guess(),
    io:fwrite("Your guess is: ~p Answer: ~p\n", [UserGuess, RandNum]).

gen_rand_num(MaxNum) ->
    rand:uniform(MaxNum).


get_guess() ->
    io:fwrite("Enter a guess (1-10):"),
    % GuessStr = string:strip(io:get_line(""), right, $\n),
    GuessStr = io:get_line(""),
    % Guess = string:strip(GuessStr, both, $\n),
    try
        Guess = list:to_integer(GuessStr),
        Guess
    catch
        _:_ -> 
            io:fwrite("Invalid Input.\n"),
            get_guess()
    end.

