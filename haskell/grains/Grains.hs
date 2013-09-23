module Grains
  ( square
  , total
  ) where

square :: Int -> Integer
square = (squares!!) . pred

squares :: [Integer]
squares = 1 : map (*2) squares

total :: Integer
total = pred $ square 65