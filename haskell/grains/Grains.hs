module Grains
  ( square
  , total
  ) where

square 1 = 1
square n = 2 * square (pred n)

total = sum $ map square [1..64]