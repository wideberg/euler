isDecreasing :: Integer -> Bool
isDecreasing x = isDecreasing' 0 x
               
isDecreasing' :: Integer -> Integer -> Bool
isDecreasing' _ 0 = True
isDecreasing' c x =
    c <= last && isDecreasing' last first
        where last = mod x 10
              first = div x 10

isIncreasing :: Integer -> Bool
isIncreasing x = isIncreasing' 9 x

isIncreasing' :: Integer -> Integer -> Bool
isIncreasing' _ 0 = True
isIncreasing' c x =
    c >= last && isIncreasing' last first
        where last = mod x 10
              first = div x 10

isBouncy :: Integer -> Bool
isBouncy x = (not (isIncreasing x)) && (not (isDecreasing x))

bouncy :: [Integer]
bouncy = filter isBouncy [1..]

bouncy_ratio :: [Float]
bouncy_ratio = map (\(x,y) -> (fromInteger x) /(fromInteger y) ) (zip [1..] bouncy)

e112 = head (filter (\(x,y) -> x == 0.99) (zip bouncy_ratio bouncy))