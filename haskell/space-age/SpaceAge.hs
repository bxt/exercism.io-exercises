module SpaceAge
  ( Planet(..)
  , ageOn
  ) where

data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune
  deriving (Show, Enum)

ageOn :: Planet -> Integer -> Float
ageOn p s = toEarthYears s / orbitalPeriod p

toEarthYears :: Integer -> Float
toEarthYears = (/ 31557600) . fromIntegral

orbitalPeriod :: Planet -> Float
orbitalPeriod p = case p of
    Mercury ->   0.2408467
    Venus   ->   0.61519726
    Earth   ->   1.0
    Mars    ->   1.8808158
    Jupiter ->  11.862615
    Saturn  ->  29.447498
    Uranus  ->  84.016846
    Neptune -> 164.79132
