print_num :: Int -> [Char]
print_num 0 = ""
print_num 1 = "one"
print_num 2 = "two"
print_num 3 = "three"
print_num 4 = "four"
print_num 5 = "five"
print_num 6 = "six"
print_num 7 = "seven"
print_num 8 = "eight"
print_num 9 = "nine"
print_num 10 = "ten"
print_num 11 = "eleven"
print_num 12 = "twelve"
print_num 13 = "thirteen"
print_num 14 = "fourteen"
print_num 15 = "fifteen"
print_num 16 = "sixteen"
print_num 17 = "seventeen"
print_num 18 = "eighteen"
print_num 19 = "nineteen"
print_num 20 = "twenty"
print_num 30 = "thirty"
print_num 40 = "fourty"
print_num 50 = "fifty"
print_num 60 = "sixty"
print_num 70 = "seventy"
print_num 80 = "eighty"
print_num 90 = "ninty"
print_num 1000 = "one thousand"

print_num x 
    | x < 100 = print_num (x - (mod x 10)) ++ "-" ++ print_num (mod x 10)
    | x < 1000 = print_num (t) ++ " hundred" ++ the_rest
    where the_rest 
              | (x-t*100) > 0 = " and " ++ print_num (x - (100*t))
              | otherwise = ""
          t = div x 100

count_chars :: [Char] -> Int
count_chars [] = 0
count_chars (x:xs)
    | x == ' ' = count_chars xs
    | x == '-' = count_chars xs
    | otherwise = 1 + count_chars xs

e17 = foldl (\x y -> x+y) 0 (map (\x -> count_chars(print_num x)) [1..1000])
