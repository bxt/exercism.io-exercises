module Grains
  ( square
  , total
  ) where

squares :: [Integer]
squares = 1 : map (*2) squares

square :: Int -> Integer
square = (squares!!) . pred

totalTo :: Int -> Integer
totalTo = pred . (squares!!)

total :: Integer
total = totalTo 64
