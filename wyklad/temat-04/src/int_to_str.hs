import Numeric (showIntAtBase)
import Data.Char (intToDigit)

intToStr :: Int -> Integer -> String
intToStr base n = showIntAtBase (fromIntegral base) intToDigit n ""