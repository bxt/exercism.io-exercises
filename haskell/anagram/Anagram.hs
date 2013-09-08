module Anagram
  ( anagramsFor
  ) where

import Data.List (sort)
import Data.Char (toLower)
import Data.Function (on)

anagramsFor :: String -> [String] -> [String]
anagramsFor = filter . anagramOf where
  anagramOf = (==) `on` (sort . map toLower)