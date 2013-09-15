module Robot
  ( robotName
  , mkRobot
  , resetName
  ) where

import Data.IORef
import System.Random (randomRIO)

type Robot = IORef String

robotName :: Robot -> IO String
robotName = readIORef

mkRobot :: IO Robot
mkRobot = robotLabel >>= newIORef

robotLabel :: IO String
robotLabel = sequence [chr, chr, num, num, num]

chr, num :: IO Char
chr = randomRIO ('A','Z')
num = randomRIO ('0','9')

resetName :: Robot -> IO ()
resetName r = robotLabel >>= writeIORef r
