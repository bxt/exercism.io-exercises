module Grains
  ( square
  , total
  ) where

square :: Int -> Integer
square = (squares!!) . pred

squares :: [Integer]
squares = 1 : map (*2) squares

totalTo :: Int -> Integer
totalTo = pred . (squares!!)

total :: Integer
total = totalTo 64
