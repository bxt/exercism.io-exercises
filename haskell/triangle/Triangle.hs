module Triangle
  ( TriangleType(..)
  , triangleType
  ) where

data TriangleType = Equilateral | Isosceles | Scalene | Illogical
  deriving (Show, Eq)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
  | 3 > countSides trangleEquation a b c = Illogical
  | 3 == sideEqualities                  = Equilateral
  | 1 == sideEqualities                  = Isosceles
  | otherwise                            = Scalene
  where sideEqualities = countSides (const (==)) a b c

trangleEquation :: Int -> Int -> Int -> Bool
trangleEquation a b c = a + b > c

countSides :: (Int -> Int -> Int -> Bool) -> Int -> Int -> Int -> Int
countSides f a b c = length $ filter id $ zipWith3 f [a, b, c] [b, c, a] [c, a, b]

