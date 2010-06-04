


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
