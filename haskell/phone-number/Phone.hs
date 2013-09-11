module Phone
  ( areaCode
  , number
  , prettyPrint
  ) where

import Data.Char

type Phonenumber = String

areaCode :: Phonenumber -> String
areaCode = take 3

number :: String -> Phonenumber
number = sanitize . clean where
  clean = filter isDigit
  sanitize "" = invalidNumber
  sanitize string@(first:rest)
    | length string == 10               = string
    | length rest == 10 && first == '1' = rest
    | otherwise                         = invalidNumber
  invalidNumber = replicate 10 '0'

prettyPrint :: Phonenumber -> String
prettyPrint = format . number
  where format [a,b,c,d,e,f,g,h,i,k] ='(':a:b:c:')':' ':d:e:f:'-':g:h:i:k:[]