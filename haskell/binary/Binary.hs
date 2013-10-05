module Binary
  ( toDecimal
  ) where

toDecimal :: String -> Integer
toDecimal = foldl f 0 where
  f n x = n * 2 + digit x
  digit '1' = 1
  digit  _  = 0
