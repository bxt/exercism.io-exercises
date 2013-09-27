module Triangle
  ( TriangleType(..)
  , triangleType
  ) where

import Control.Applicative

data TriangleType = Equilateral | Isosceles | Scalene | Illogical
  deriving (Show, Eq)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
  | 3 > countSides trangleEquation a b c = Illogical
  | 3 == countSides (const (==)) a b c   = Equilateral
  | 1 == countSides (const (==)) a b c   = Isosceles
  | otherwise                            = Scalene

trangleEquation :: Int -> Int -> Int -> Bool
trangleEquation a b c = a + b > c

countSides :: (Int -> Int -> Int -> Bool) -> Int -> Int -> Int -> Int
countSides f a b c = length $ filter (uncurry3 f) [(a, b, c), (b, c, a), (c, a, b)]

uncurry3 :: (a -> b -> c -> d) -> (a, b, c) -> d
uncurry3 f (a,b,c) = f a b c