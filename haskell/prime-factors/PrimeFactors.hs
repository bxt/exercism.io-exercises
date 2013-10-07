module PrimeFactors
  ( primeFactors
  ) where

primeFactors :: Integer -> [Integer]
primeFactors = primeFactors' 2 where
  primeFactors' k n
    | k*k > n        = if n > 1 then [n] else []
    | n `mod` k == 0 = [k] ++ primeFactors'  k   (n `div` k)
    | otherwise      =        primeFactors' (k+1) n
