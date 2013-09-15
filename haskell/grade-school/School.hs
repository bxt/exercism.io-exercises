module School
  ( empty
  , add
  , grade
  , sorted
  , School
  ) where

import Data.Set (Set)
import qualified Data.Set as Set

import Data.Map (Map)
import qualified Data.Map as Map

import Control.Arrow (second)

type School = Map Int (Set String)

empty :: School
empty = Map.empty

add :: Int -> String -> School -> School
add = (. Set.singleton) . Map.insertWith Set.union

grade :: Int -> School -> [String]
grade = (Set.toList .) . Map.findWithDefault Set.empty

sorted :: School -> [(Int, [String])]
sorted = map (second Set.toList) . Map.toList
