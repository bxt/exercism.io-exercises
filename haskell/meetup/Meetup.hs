module Meetup
  ( Weekday(..)
  , Schedule(..)
  , meetupDay
  ) where

import Control.Monad (liftM)
import Control.Monad.Instances

import Data.Time.Calendar
import Data.Time.Calendar.WeekDate (toWeekDate)

enumFromDown :: Enum a => a -> [a]
enumFromDown x = enumFromThen x (pred x)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Enum, Eq, Show)

fromDay :: Day -> Weekday
fromDay = toEnum . toWeekNumber where
  toWeekNumber d = let (_,_,dow) = toWeekDate d in dow - 1

type Year = Integer
type Month = Int
type Date = Int
type YearMonth a = (Year, Month) -> a

data Schedule = Teenth | First | Second | Third | Fourth | Last
  deriving Show

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay = (curry .) . meetupDayM  where
  meetupDayM s w = liftM (findWeekday w) $ mapM fromGregorianM =<< candidates s

candidates :: Schedule -> YearMonth [Date]
candidates First  = week 1
candidates Second = week 2
candidates Third  = week 3
candidates Fourth = week 4
candidates Teenth = teenths
candidates Last   = lastDays

week :: Int -> YearMonth [Date]
week n = return $ map (+ (n-1)*7) [1..7]

teenths :: YearMonth [Date]
teenths  = return [13..19]

lastDays :: YearMonth [Date]
lastDays = liftM (take 7 . enumFromDown) (uncurry gregorianMonthLength)

findWeekday :: Weekday -> [Day] -> Day
findWeekday w = head . filter ((== w) . fromDay)

fromGregorianM :: Date -> YearMonth Day
fromGregorianM = flip $ uncurry fromGregorian
