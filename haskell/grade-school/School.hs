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

type School = Map Int (Set String)

empty :: School
empty = Map.empty

add :: Int -> String -> School -> School
add grade name school = newGrades
  where
    newGrades = Map.insert grade newNames school
    newNames = Set.insert name currentNames
    currentNames = gradeSet grade school

grade :: Int -> School -> [String]
grade grade' school = Set.toList (gradeSet grade' school)

gradeSet :: Int -> School -> Set String
gradeSet grade school = Map.findWithDefault Set.empty grade school

sorted :: School -> [(Int, [String])]
sorted school = Map.toList $ Map.map Set.toList school