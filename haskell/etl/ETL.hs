{-# LANGUAGE TupleSections #-}

module ETL
  ( transform
  ) where

import Data.Char (toLower)

import Data.Map (Map)
import qualified Data.Map as Map

transform :: Map Int [String] -> Map String Int
transform = Map.fromList . transformList . Map.toList
  where transformList = concatMap (uncurry stringsToEntries)

stringsToEntries points = map ((,points) . map toLower)
