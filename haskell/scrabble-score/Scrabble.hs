{-# LANGUAGE TupleSections #-}

module Scrabble
  ( scoreLetter
  , scoreWord
  ) where

import Data.Char (toUpper)
import Data.Array.IArray
import Data.Array.Unboxed

scores :: UArray Char Int
scores = array ('A','Z') (s >>= x) where
  s = [ ("AEIOULNRST",  1)
      , ("DG"        ,  2)
      , ("BCMP"      ,  3)
      , ("FHVWY"     ,  4)
      , ("K"         ,  5)
      , ("JX"        ,  8)
      , ("QZ"        , 10)
      ]
  x (a,b) = map (,b) a

scoreLetter :: Char -> Int
scoreLetter = (scores !) . toUpper where

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter
