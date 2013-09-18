module ETL
  ( transform
  ) where

import Data.Char (toLower)

import Data.Map (Map)
import qualified Data.Map as Map

transform :: Map Int [String] -> Map String Int
transform = Map.fromList . concat . map (\(points, letters) -> map ((\l -> (l, points)) . map toLower) letters) . Map.toList