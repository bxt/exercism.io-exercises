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
meetupDay s w y m = runReader (combiReader s w) (y, m)

combiReader s w = do
  cands <- candidates s
  days <- mapM fromGregorian' cands
  return $ findWeekday w days

type CandidateGenerator = Reader MY [Int]

fromGregorian' :: Int -> Reader MY Day
fromGregorian' d = do
  y <- asks year
  m <- asks month
  return $ fromGregorian y m d

candidates :: Schedule -> Reader MY [Int]
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
lastDays = do
  ml <- gregorianMonthLength'
  return $ take 7 $ enumFromDown ml

gregorianMonthLength' :: Reader MY Int
gregorianMonthLength' = do
  y <- asks year
  m <- asks month
  return $ gregorianMonthLength y m

findWeekday :: Weekday -> [Day] ->  Day
findWeekday w = head . filter ((== w) . fromDay)

fromDay :: Day -> Weekday
fromDay = toEnum . toWeekNumber where
  toWeekNumber d = let (_,_,dow) = toWeekDate d in dow - 1

enumFromDown :: Enum a => a -> [a]
enumFromDown x = enumFromThen x (pred x)


