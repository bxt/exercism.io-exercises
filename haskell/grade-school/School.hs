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
add grade name school = Map.insert grade newNames school
  where
    newNames = Set.insert name currentNames
    currentNames = gradeSet grade school

grade :: Int -> School -> [String]
grade grade' school = Set.toList (gradeSet grade' school)

gradeSet :: Int -> School -> Set String
gradeSet = Map.findWithDefault Set.empty

sorted :: School -> [(Int, [String])]
sorted = map (second Set.toList) . Map.toList
