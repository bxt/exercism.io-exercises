module Grains
  ( square
  , total
  ) where

import Data.Bits (shift)

squares = shift 1

square :: Int -> Integer
square = squares . pred

totalTo :: Int -> Integer
totalTo = pred . squares

total :: Integer
total = totalTo 64
