module Grains
  ( square
  , total
  ) where

square = (2 ^^) . pred

total = pred $ square 65