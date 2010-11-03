pal_num' b 0 y = y
pal_num' b x y = pal_num' b (div x b) (b*y + (mod x b))

is_palindrom_number :: Int -> Int -> Bool
is_palindrom_number b x | (mod x b) == 0 =  False
                        | (pal_num' b x 0) == x = True
                        | otherwise = False

-- Find the sum of all numbers, less than one million,
-- which are palindromic in base 10 and base 2.
e36 = sum [x | x <- [1..999999],
           (is_palindrom_number 2 x) &&
           (is_palindrom_number 10 x)]
