import MyMath

pow :: Integer -> Integer -> Integer
pow x 1 = x
pow x y = x * pow x (y-1)


--pow_2 0 = 1
--pow_2 x = 2 * pow_2 (x-1)

pow_2d :: Integer -> Integer
pow_2d 0 = 1
pow_2d 1 = 2
pow_2d x = z*z
    where z = pow_2d (div x 2)

pow_2p :: (Integer, Integer) -> Integer
pow_2p (x, p)
    | x == 0 = 1
    | otherwise =  pow_2d ((mod x 2) * (pow2 p)) * pow_2p (div x 2, (p+1))

pow2 :: Integer -> Integer
pow2 x = pow_2p (x,0)

-- Euler 97: Find the 10 last digits of the non-Mersienne
-- prime 28433 * 2 ^ 7830457 + 1
e97 = mod (pow2 7830457 *  28433 + 1) 10000000000




--data ZZ = Z Integer Integer
--instance Show ZZ where
--    show (Z (a,b))  = (show a) ++ "+i" ++ (show b)


-- Integer complex number class
class Complex a where
    cadd :: (a,a) -> (a,a) -> (a,a)
    csub :: (a,a) -> (a,a) -> (a,a)


instance Complex Integer where
    cadd (a,b) (c,d) = (a+c,b+d)
    csub (a,b) (c,d) = (a-c,b-d)
