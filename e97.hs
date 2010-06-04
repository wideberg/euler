import MyMath

-- Euler 97: Find the 10 last digits of the non-Mersienne
-- prime 28433 * 2 ^ 7830457 + 1
e97 = mod (pow2 7830457 *  28433 + 1) 10000000000
