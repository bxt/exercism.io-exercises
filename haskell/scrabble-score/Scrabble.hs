module Scrabble
  ( scoreLetter
  , scoreWord
  ) where

import Data.Char (toUpper)

scoreLetter :: Char -> Int
scoreLetter = scoreUpperLetter . toUpper where
  scoreUpperLetter l
    | l `elem` "AEIOULNRST" =  1
    | l `elem` "DG"         =  2
    | l `elem` "BCMP "      =  3
    | l `elem` "FHVWY"      =  4
    | l `elem` "K"          =  5
    | l `elem` "JX "        =  8
    | l `elem` "QZ"         = 10
    | otherwise             = error $ l:" can not be scored"

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter
