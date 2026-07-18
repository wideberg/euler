import Data.List (nub, sort)

pow :: Integer -> Integer -> Integer
pow _ 0 = 1
pow a b = a * (pow a (b-1))

a = [2..100]
b = a

cartesian :: [a] -> [b] -> [(a, b)]
cartesian xs ys = [(x, y) | x <- xs, y <- ys]

all_combos = cartesian a b

f :: (Integer, Integer) -> Integer
f (x,y) = pow x y

s = nub $ sort $ map f all_combos

e29 = length s
