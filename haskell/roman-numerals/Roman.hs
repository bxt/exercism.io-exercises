module Roman
  ( numerals
  ) where

numerals :: Int -> String
numerals = numerals' digits where
  numerals' _            0             = ""
  numerals' x@((l,m):xs) n | n >= m    = l ++ numerals' x  (n-m)
                           | otherwise =      numerals' xs n
  digits = [ ( "M",1000)
           , ("CM", 900)
           , ( "D", 500)
           , ("CD", 400)
           , ( "C", 100)
           , ("XC",  90)
           , ( "L",  50)
           , ("XL",  40)
           , ( "X",  10)
           , ("IX",   9)
           , ( "V",   5)
           , ("IV",   4)
           , ( "I",   1)
           ]
