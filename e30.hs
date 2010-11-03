
pow :: Int -> Int -> Int
pow _ 0 = 1
pow x n = x * (pow x (n-1))

digpowsum :: Int -> Int -> Int
digpowsum _ 0 = 0
digpowsum n x = pow (mod x 10) n + (digpowsum n (div x 10))

numbers = [x | x <- [2..1000000], x == (digpowsum 5 x)]

-- Find the sum of all the numbers that can be written as
-- the sum of fifth powers of their digits.
e30 = sum(numbers)
