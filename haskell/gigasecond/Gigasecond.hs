module Gigasecond
  ( fromDay
  ) where

import Data.Time.Calendar

fromDay :: Day -> Day
fromDay = addDays gigasecondsDays

gigasecondsDays = giga `div` secondsPerDay

secondsPerDay = 60 * 60 * 24

giga = 10^9