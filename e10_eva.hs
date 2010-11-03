
foo = sum[x::Integer|x <- [1..1999999],
          all (==False) [mod x y == 0| y <- [2..floor(sqrt (fromIntegral x))]]] - 1


bar = [x::Integer|x <- [2..1999999],
          all (==False) [mod x y == 0| y <- [2..floor(sqrt (fromIntegral x))]]]