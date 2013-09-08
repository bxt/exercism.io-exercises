{-# LANGUAGE TupleSections #-}

module WordCount
  ( wordCount
  ) where

import Data.Char
import Data.Map hiding (map)

wordCount :: String -> Map String Integer
wordCount =  count . words . normalize

normalize :: String -> String
normalize = map normalizeOne where
  normalizeOne c
    | isAlpha c = toLower c
    | isDigit c = c
    | otherwise = ' '

count :: [String] -> Map String Integer
count = fromListWith (+) . map (,1)
  
  

