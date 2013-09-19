module Meetup
  ( Weekday(..)
  , Schedule(..)
  , meetupDay
  ) where

import Data.Char (toLower)

import Data.Map (Map)
import qualified Data.Map as Map

import Data.Time.Calendar

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving Show

type Month = Int
type Year = Int

data Schedule = Teenth | First | Second | Third | Fourth | Last
  deriving Show

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay = undefined