{-# LANGUAGE TupleSections #-}

module DNA
  ( count
  , nucleotideCounts
  ) where

import Data.Map (Map)
import qualified Data.Map as Map

count :: Char -> String -> Int
count nucleotide
  | validNucleotide nucleotide = length . filter (==nucleotide)
  | otherwise = error $ "invalid nucleotide " ++ show nucleotide

nucleotideCounts :: String -> Map Char Int
nucleotideCounts sequence = Map.fromList $ map f "ACGT" where
  f n = (n,count n sequence)

validNucleotide = (`elem` "ACGTU")