import Data.Time (utctDay, getCurrentTime, diffDays, readTime)
import Locale (defaultTimeLocale)
import Control.Monad
import Text.Printf (printf)
import SpaceAge (Planet(..), ageOn)

main = do
  putStrLn "Your birthday: "
  born <- getLine >>= return . readTime defaultTimeLocale "%d.%m.%Y"
  current <- getCurrentTime >>= return . utctDay
  putStrLn "Your age: "
  forM_ [Mercury .. Neptune] $ \p -> do
    let age = (ageOn p) $ (*86400) $ diffDays current born
    printf "  %6.2f %s-years\n" age (show p)