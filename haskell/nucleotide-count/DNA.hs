{-# LANGUAGE TupleSections #-}

module DNA
  ( count
  , nucleotideCounts
  ) where

import Data.Map (Map)
import qualified Data.Map as Map

nucleotides = "ACGT"

count :: Char -> String -> Int
count nucleotide
  | validNucleotide nucleotide = length . filter (==nucleotide)
  | otherwise = error $ "invalid nucleotide " ++ show nucleotide

nucleotideCounts :: String -> Map Char Int
nucleotideCounts = Map.fromListWith (+) . addZeros . map (,1)
  where addZeros = (map (,0) nucleotides ++)

validNucleotide = (`elem` 'U':nucleotides)