import Prelude hiding (length)

-- Wersja bezpośrednio bazująca na tym, że długość pustej listy to zero, a w innym przypadku długość listy jest o jeden większa niż długość jej ogona.
-- length [] = 0
-- length (_:t) = 1 + length t

-- length [1,2,3]
-- 1 + length [2,3]
-- 1 + (1 + length [3])
-- 1 + (1 + (1 + length []))
-- 1 + (1 + (1 + 0))
-- 1 + (1 + 1)
-- 1 + 2
-- 3

-- Wersja z rekurencją ogonową
length :: [a] -> Int
length lst = length_hlp lst 0

length_hlp [] acc = acc
length_hlp (_:t) acc = length_hlp t (acc + 1)

-- length [1,2,3]
-- length_hlp [1,2,3] 0
-- length_hlp [2,3] 1
-- length_hlp [3] 2
-- length_hlp [] 3
-- 3