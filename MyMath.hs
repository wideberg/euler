module MyMath (count_digits, count_list, factorial, fib, pow, pow2, sum_digits) where

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x*(factorial (x-1))

-- Count the number of digits in a number
count_digits :: Integer -> Integer
count_digits x
    | x < 10 = 1
    | otherwise = 1 + count_digits (div x 10)

-- Count the number of elements in a list
count_list :: [a] -> Integer
count_list [] = 0
count_list (x:xs) = 1 + (count_list xs)

-- Sum the digits in a number
sum_digits :: Integer -> Integer
sum_digits x
    | x < 10 = x
    | otherwise = (mod x 10) + sum_digits (div x 10)

-- Infinite list of fibonacci numbers
fib :: [Integer]
fib = fib'(1, 1)
    where fib' (x, y) = x : fib' (y, x+y)

-- Normal pow
pow :: Integer -> Integer -> Integer
pow x 1 = x
pow x y = x * pow x (y-1)


-- Fast implementation of pow2
pow_2d :: Integer -> Integer
pow_2d 0 = 1
pow_2d 1 = 2
pow_2d x = z*z
    where z = pow_2d (div x 2)

pow2' :: (Integer, Integer) -> Integer
pow2' (x, p)
    | x == 0 = 1
    | otherwise =  pow_2d ((mod x 2) * (pow2 p)) * pow2' (div x 2, (p+1))

pow2 :: Integer -> Integer
pow2 x = pow2' (x,0)
