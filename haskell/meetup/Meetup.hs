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

import Control.Monad.Reader

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Enum, Eq, Show)

type Month = Int
type Year = Integer
type MY = (Integer, Int)
year = fst
month = snd

data Schedule = Teenth | First | Second | Third | Fourth | Last
  deriving Show

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay s w = curry $ combiReader s w

combiReader s w = liftM (findWeekday w) $ mapM fromGregorian' =<< candidates s

type CandidateGenerator = MY -> [Int]

fromGregorian' :: Int -> MY -> Day
fromGregorian' = flip $ uncurry fromGregorian

candidates :: Schedule -> MY -> [Int]
candidates First  = week 1
candidates Second = week 2
candidates Third  = week 3
candidates Fourth = week 4
candidates Teenth = teeths
candidates Last   = lastDays

week :: Int -> CandidateGenerator
week n = return $ map (+ (n-1)*7) [1..7]

teeths :: CandidateGenerator
teeths  = return [13..19]

lastDays :: CandidateGenerator
lastDays = liftM (take 7 . enumFromDown) gregorianMonthLength'

gregorianMonthLength' :: MY -> Int
gregorianMonthLength' = uncurry gregorianMonthLength

findWeekday :: Weekday -> [Day] -> Day
findWeekday w = head . filter ((== w) . fromDay)

fromDay :: Day -> Weekday
fromDay = toEnum . toWeekNumber where
  toWeekNumber d = let (_,_,dow) = toWeekDate d in dow - 1

enumFromDown :: Enum a => a -> [a]
enumFromDown x = enumFromThen x (pred x)


