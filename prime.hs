module Prime where

primes :: [Integer]
primes = 2 : [x | x <- [3,5..], isPrime x ] where

    isPrime :: Integer -> Bool
    isPrime x = not divisibleByAny
        where

          -- Returns True if x is divisible by any number in reducedPrimeSet
          divisibleByAny :: Bool
          divisibleByAny = any divisible reducedPrimeSet
              where

                -- Returns True if d divides x
                divisible :: Integer -> Bool
                divisible d = (mod x d) == 0

          reducedPrimeSet :: [Integer]
          reducedPrimeSet = takeWhile lessThanSqrtOf primes
              where

                -- Returns True if y < sqrt(x)
                lessThanSqrtOf :: Integer -> Bool
                lessThanSqrtOf y = y <= (floor (sqrt (fromIntegral x)))
