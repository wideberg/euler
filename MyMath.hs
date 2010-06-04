module MyMath (count_digits, count_list, factorial, fib, sum_digits) where

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x*(factorial (x-1))

sum_digits :: Integer -> Integer
sum_digits x
    | x < 10 = x
    | otherwise = (mod x 10) + sum_digits (div x 10)


fib :: [Integer]
fib = fib'(1, 1)
    where fib' (x, y) = x : fib' (y, x+y)

count_digits :: Integer -> Integer
count_digits x
    | x < 10 = 1
    | otherwise = 1 + count_digits (div x 10)
 
count_list :: [a] -> Integer
count_list [] = 0
count_list (x:xs) = 1 + (count_list xs)
