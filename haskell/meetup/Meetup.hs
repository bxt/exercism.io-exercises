module Meetup
  ( Weekday(..)
  , Schedule(..)
  , meetupDay
  ) where

import Data.Char (toLower)

import Data.Map (Map)
import qualified Data.Map as Map

import Data.Time.Calendar
import Data.Time.Calendar.WeekDate (toWeekDate)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Enum, Eq, Show)

type Month = Int
type Year = Integer

data Schedule = Teenth | First | Second | Third | Fourth | Last
  deriving Show

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay s w y m = findWeekday w $ candidates s y m

candidates :: Schedule -> Year -> Month -> [Day]
candidates First = week 1
candidates Second = week 2
candidates Third = week 3
candidates Fourth = week 4
candidates Teenth = teeths
candidates Last = lastDays

daysOfMonth y m ds = map (fromGregorian y m) ds
week n y m =  daysOfMonth y m $ map (+((n-1)*7)) [1..7]

teeths :: Year -> Month -> [Day]
teeths y m = daysOfMonth y m [13..19]

lastDays :: Year -> Month -> [Day]
lastDays y m = daysOfMonth y m $ take 7 $ enumFromdDown (gregorianMonthLength y m)

enumFromdDown x = enumFromThen x (pred x)

findWeekday :: Weekday -> [Day] ->  Day
findWeekday w = head . filter (\d -> fromDay d == w)

fromDay :: Day -> Weekday
fromDay = toEnum . toWeekNumber
toWeekNumber :: Day -> Int
toWeekNumber d = let (_,_,dow) = toWeekDate d in dow - 1