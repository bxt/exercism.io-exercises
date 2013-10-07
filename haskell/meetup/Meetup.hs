module Meetup
  ( Weekday(..)
  , Schedule(..)
  , meetupDay
  ) where

import Control.Monad (liftM)
import Control.Monad.Instances

import Data.Time.Calendar
import Data.Time.Calendar.WeekDate (toWeekDate)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Enum, Eq, Show)

type Year = Integer
type Month = Int
type Date = Int
type YearMonth a = (Year, Month) -> a

data Schedule = Teenth | First | Second | Third | Fourth | Last
  deriving (Enum, Show)

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay s w = curry $ advanceWeekday w . weekStart s where
  weekStart = (fromGregorianM =<<) . weekStartDate

weekStartDate :: Schedule -> YearMonth Date
weekStartDate Teenth = teenths
weekStartDate Last   = lastDays
weekStartDate s      = week $ fromEnum s

week :: Int -> YearMonth Date
week = return . succ . (*7) . pred

teenths :: YearMonth Date
teenths  = return 13

lastDays :: YearMonth Date
lastDays = liftM (subtract 6) (uncurry gregorianMonthLength)

fromGregorianM :: Date -> YearMonth Day
fromGregorianM = flip $ uncurry fromGregorian

advanceWeekday :: Weekday -> Day -> Day
advanceWeekday = (addDays =<<) . (fromIntegral .) . daysToWeekday

daysToWeekday :: Weekday -> Day -> Int
daysToWeekday w d = (fromEnum w - d') `mod` 7 where
  (_, _, d' + 1) = toWeekDate d
