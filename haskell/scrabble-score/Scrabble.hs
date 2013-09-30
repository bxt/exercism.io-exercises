module Scrabble
  ( scoreLetter
  , scoreWord
  ) where

import Data.Char (toUpper)
import Data.Array.IArray
import Data.Array.Unboxed

scores :: UArray Char Int
scores = array r [(l, s l) | l <- range r] where
  r = ('A','Z')
  s l
    | l `elem` "AEIOULNRST" =  1
    | l `elem` "DG"         =  2
    | l `elem` "BCMP "      =  3
    | l `elem` "FHVWY"      =  4
    | l `elem` "K"          =  5
    | l `elem` "JX "        =  8
    | l `elem` "QZ"         = 10
    | otherwise             = error $ l:" can not be scored"

scoreLetter :: Char -> Int
scoreLetter = (scores !) . toUpper where

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter

