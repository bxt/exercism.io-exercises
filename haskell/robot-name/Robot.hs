module Robot
  ( robotName
  , mkRobot
  , resetName
  ) where

import Data.Char (chr)
import Data.IORef
import System.Random (randomRIO)

type Robot = IORef String

robotName :: Robot -> IO String
robotName = readIORef

mkRobot :: IO Robot
mkRobot = robotLabel >>= newIORef

robotLabel :: IO String
robotLabel = mapM (fmap chr) [char, char, num, num, num]

char, num :: IO Int
char = randomRIO (65,90)
num  = randomRIO (48,57)

resetName :: Robot -> IO ()
resetName r = robotLabel >>= writeIORef r
