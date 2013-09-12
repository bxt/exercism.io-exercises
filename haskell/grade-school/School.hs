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


data School = School (Map Int (Set String))
  deriving Show

empty :: School
empty = School Map.empty

add :: Int -> String -> School -> School
add grade name (School grades) = (School newGrades)
  where
    newGrades = Map.insert grade newNames grades
    newNames = Set.insert name currentNames
    currentNames = Map.findWithDefault Set.empty grade grades

grade :: Int -> School -> [String]
grade grade' (School grades) = Set.toList (Map.findWithDefault Set.empty grade' grades)

sorted :: School -> [(Int, [String])]
sorted (School grades) = Map.toList $ Map.map Set.toList grades