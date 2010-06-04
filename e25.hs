import MyMath

-- Euler 25: The first fibinacci term to contain 1000 digits
e25 = count_list (takeWhile (\n -> count_digits n < 1000) fib) + 1
