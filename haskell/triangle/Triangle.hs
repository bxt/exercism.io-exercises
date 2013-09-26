module Triangle
  ( TriangleType(..)
  , triangleType
  ) where

data TriangleType = Equilateral | Isosceles | Scalene | Illogical
  deriving (Show, Eq)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType = undefined