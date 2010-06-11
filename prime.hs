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
lessThanSqrtOf x y = y < (x `div` 2)
--lessThanSqrtOf x y = (y :: Float) < sqrt(x)

reducedPrimeSet :: Integer -> [Integer] -> [Integer]
reducedPrimeSet x ps = takeWhile (lessThanSqrtOf x) ps
--reducedPrimeSet x p = [2,3,5,7]
--reducedPrimeSet x p = head ((length p) - 1) p
--     where
--       d = [y | y <- (takeWhile (<x) p)]

--multiDivisible x y = 
-- divisible :: Int -> [Int] -> Bool
-- divisible x y | length(d) < length(y) = True
-- 		| otherwise = False
--     where d = filter (not.(==0)) r
-- 	  r = map (mod x) y

-- isPrime :: Float -> Bool
-- isPrime x = not (divisible x [y | y <- (takeWhile (<=t) primes)])
-- 	    where t = x - 5
--t = fromIntegral (floor (sqrt x))

isPrime :: [Integer] -> Integer -> Bool
isPrime p x = if (multiDivisible x (reducedPrimeSet x p))
              then False
              else True

primes :: [Integer]
primes = 2 : 3 : 5 : 7 : [x | x <- [8..], isPrime primes x ]

-- TODO: Exchange Int for Integer (is bignum)
main = do
  args <- getArgs
  print (take 10 primes)
  print (divisible 8 4)
  print (divideSeveral 52 [2,3,4,5,6,7,8,9,10,11,12,13])
  print (multiDivisible 13 [2,3,4,5,6,7,8,9,10,11,12])
--  print (reducedSet [2,3,5,7,11,13] 6)
  print (lessThanSqrtOf 25 6)
  print (lessThanSqrtOf 25 4)