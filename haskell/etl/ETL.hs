module ETL
  ( transform
  ) where

import Data.Char (toLower)

import Data.Map (Map)
import qualified Data.Map as Map

transform :: Map Int [String] -> Map String Int
transform = undefined