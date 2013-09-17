module LeapYear
  ( isLeapYear
  ) where

isLeapYear :: Int -> Bool
isLeapYear y
  | divisible 400 y = True
  | divisible 100 y = False
  | divisible   4 y = True
  | otherwise       = False

divisible :: Int -> Int -> Bool
divisible by n = rem n by == 0
