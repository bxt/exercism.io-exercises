module DNA
  ( toRNA
  ) where

toRNA :: String -> String
toRNA = map toRnaSingle

toRnaSingle :: Char -> Char
toRnaSingle 'T' = 'U'
toRnaSingle  n  =  n
