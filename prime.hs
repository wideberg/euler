module Main where

import System

-- Returns True if y divides x
divisible :: Integer -> Integer -> Bool
divisible x y = if ( (mod x y) == 0 )
                then True
                else False

-- Return the values in y that divide x
divideSeveral :: Integer -> [Integer] -> [Integer]
divideSeveral x y = filter (divisible x) y


-- Returns True if x is divisible by any number in y
multiDivisible :: Integer -> [Integer] -> Bool
multiDivisible x y = (0 /= length (divideSeveral x y))

-- Returns True if y < sqrt(x)
lessThanSqrtOf :: Integer -> Integer -> Bool
lessThanSqrtOf x y = y <= (x `div` 2)
--lessThanSqrtOf x y = (y :: Float) < sqrt(x)

reducedPrimeSet :: Integer -> [Integer] -> [Integer]
reducedPrimeSet x ps = takeWhile (lessThanSqrtOf x) ps

isPrime :: [Integer] -> Integer -> Bool
isPrime p x = if (multiDivisible x (reducedPrimeSet x p))
              then False
              else True

primes :: [Integer]
primes = 2 : [x | x <- [3,5..], isPrime primes x ]

