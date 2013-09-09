module DNA
  ( hammingDistance
  ) where

hammingDistance :: String -> String -> Int
hammingDistance strandA strandB = length $ filter id $ zipWith (/=) strandA strandB