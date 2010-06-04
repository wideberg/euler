d :: Integer -> Integer
d 0 = 0
d k = (mod k 10) + d (div k 10)

len :: [a] -> Integer
len [] = 0
len (x:xs) = 1 + len xs

pow10 :: Integer -> Integer
pow10 0 = 1
pow10 x = 10 * pow10 (x-1)

raw :: Integer -> [Integer]
raw k = takeWhile (\x -> x < (pow10 k)) [23,46..]

s :: Integer -> Integer
s k = len s'
   where s' = filter sprop (raw k)

--s' :: [Integer] -> [Integer]
--s' ks = 

sprop :: Integer -> Bool
sprop k = (d k) == 23
-- && (mod k 23) == 0


main = do
  print "Hello world"
