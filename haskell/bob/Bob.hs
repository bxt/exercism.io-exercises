module Bob
  ( responseFor
  ) where

import Data.Char
import Data.List (isSuffixOf)

responseFor :: String -> String
responseFor text
  | isShouting text = "Woah, chill out!"
  | isQuestion text = "Sure."
  | isSilence  text = "Fine. Be that way!"
  | otherwise       = "Whatever."

isSilence :: String -> Bool
isSilence = all isSpace

isShouting :: String -> Bool
isShouting text = not (any isLower text) && any isAlpha text

isQuestion :: String -> Bool
isQuestion = ("?" `isSuffixOf`)
