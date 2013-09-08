module Beer
  ( sing
  , verse
  ) where

verse :: Integer -> String
verse 0 = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
verse n = bottlesOfBeer n ++ " on the wall, " ++ bottlesOfBeer n ++ ".\nTake " ++ pronoun n ++ " down and pass it around, " ++ bottlesOfBeer (n-1) ++ " on the wall.\n"

bottlesOfBeer :: Integer -> String
bottlesOfBeer = (++ " of beer") . bottles where
  bottles 0 = "no more bottles"
  bottles 1 = "1 bottle"
  bottles n = show n ++ " bottles"

pronoun :: Integer -> String
pronoun 1 = "it"
pronoun _ = "one"

sing :: Integer -> Integer -> String
sing from to = unlines $ map verse [from, from-1 .. to]