-module(euler).
-export([sum/1, p1/1, p2/0]).
-compile(export_all).

-import(lists).

%% Problem 1
%% Add all the natural numbers below one thousand that are multiples of 3 or 5.
sum([X]) -> X;
sum([X|XS]) ->
    X + sum(XS).

p1(N) ->
    sum([ X ||
	X <- lists:seq(1,N-1),
	(X rem 3 =:= 0) or (X rem 5 =:= 0)
	   ]).

p1() ->
    p1(1000).


%% Problem 2
%% Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.
fib(X,Y,N) when X+Y > N -> [];
fib(X,Y,N) -> [(X+Y)|fib(Y,(X+Y), N)].
fib(N) -> [1,2|fib(1,2,N)].


p2(N) -> sum(
	   [ X ||
	       X <- fib(N-1),
	       X rem 2 =:= 0
		  ]
	  ).

p2() ->
    p2(4000000).


%% Problem 3
%% Find the largest prime factor of a composite number.

factors(N,X) when X =:= N -> [X];
factors(N,X) when N rem X =:= 0 ->
    [X|factors(N div X,X)];
factors(N,X) -> factors(N,X+1).
    

factors(N) ->
    factors(N,2).

p3() ->
    lists:max(factors(600851475143)).


%% Problem 4
%% Find the largest palindrome made from the product of two 3-digit numbers.

reverse_number(X, Y) when X < 10 -> Y * 10 + X;
reverse_number(X, Y) ->
    reverse_number( X div 10, Y * 10 + X rem 10).
reverse_number(N) ->
    reverse_number(N,0).

is_palindrome_number(N) ->
    N =:= reverse_number(N).

p4() -> 
    lists:max(
      [A*B ||
	  A <- lists:seq(100,999),
	  B <- lists:seq(100,999),
	  is_palindrome_number(A*B)
	     ]
     ).


%% Problem 16
%% What is the sum of the digits of the number 2^1000?

sum_digits(N) when N < 10 -> N;
sum_digits(N) -> (N rem 10) + sum_digits(N div 10).

my_pow(_,0) -> 1;
my_pow(X,Y) -> X * my_pow(X,Y-1).

p16() ->
    sum_digits(my_pow(2,1000)).


%% Problem 20
%% Find the sum of the digits in the number 100!

my_fac(1) -> 1;
my_fac(N) -> N * my_fac(N-1).

p20() ->
    sum_digits(my_fac(100)).
   

%% Problem 10
%% Find the sum of all the primes below two million.

is_dividable(X,Y) ->
    X rem Y =:= 0.

prime_factors(1,_) -> [];
prime_factors(X,[]) -> [X];
prime_factors(X,[P|Ps])  ->
    case is_dividable(X,P) of
	true -> 
	    [P|prime_factors(X div P, [P|Ps])];
	false ->
	    prime_factors(X,Ps)
    end
.
    
%is_prime(X, PS) ->
%    length(prime_factors(X,PS)) =:= 1.

is_prime(_, []) -> true;
is_prime(X,[P|PS]) ->
    case is_dividable(X,P) of
	true -> false;
	false -> is_prime(X,PS)
    end.

primes(X,PS,M) when X >= M -> PS;
primes(X,PS,M) ->
    case is_prime(X,lists:takewhile(fun(P) -> P < math:sqrt(X)+1 end,PS)) of
	true -> primes(X+2,PS ++ [X],M);
	false -> primes(X+2,PS,M)
    end.

primes(M) ->
    primes(3,[2],M).

p10() ->
    sum(primes(2000000-1)).


%% Problem 7
%% What is the 10001^st prime number?

p7() ->
    lists:nth(10001,primes(200000)).


%% Problem 48
%% Find the last ten digits of the series, 1^(1) + 2^(2) + 3^(3) + ... + 1000^(1000).

p48() ->
    sum([my_pow(Y,Y) ||
       Y <- lists:seq(1,1000)]) rem 10000000000.



%% Problem 67
%% Using an efficient algorithm find the maximal sum in the triangle?

eliminate([_|[]]) -> [];
eliminate([H1|[H2|T]]) when H1 > H2 ->
    [ H1 | eliminate([H2|T])];
eliminate([_|[H2|T]]) ->
    [ H2 | eliminate([H2|T])].

add_lists([],[]) -> [];
add_lists([H1|T1],[H2|T2]) ->
    [H1+H2 | add_lists(T1,T2)].

climb_pyr(Row,[Top|[]]) -> add_lists(Row,Top);
climb_pyr(Row,[Bottom|Top]) ->
    climb_pyr(eliminate(add_lists(Row,Bottom)),Top).

climb_pyr([Bottom|Top]) ->
    climb_pyr(eliminate(Bottom),Top).
    
parse_line(L) ->
    [ X ||
	{X,_} <- [ string:to_integer(Y) ||
		     Y <- string:tokens(L, " \n")
			]
	   ].

read_lines(S,Result) ->
    begin
	Line = io:get_line(S,''),
	if
	    Line =:= eof ->
		Result;
	    true ->
		read_lines(S,[parse_line(Line)|Result])
	end
    end.

read_data() ->
    begin
	{ok,S} = file:open("triangle.txt", read),
	read_lines(S,[])
%	file:close(S)
    end.

p67() ->
    climb_pyr(read_data()).
