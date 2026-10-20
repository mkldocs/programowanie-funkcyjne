import Prelude hiding (length,head,tail,(!!),reverse)

length :: [a] -> Int
-- length [] = 0
-- length (_:t) = 1 + length t

length lst = length_hlp lst 0

length_hlp [] acc = acc
length_hlp (_:t) acc = length_hlp t (acc + 1)
[x]
[] !!  _ = error "index error"
(h:_) !! 0 = h
(h:t) !! n
    | n < 1     = error "index error"
    | otherwise = t !! (n - 1)

insert x lst = x:lst
-- insert = (:)

append x [] = [x]
append x (h:t) = h : (append x t)

-- reverse [] = []
-- reverse (h:t) = (reverse t) ++ [h]

reverse lst = reverse_hlp lst []

reverse_hlp [] lst_tmp = lst_tmp
reverse_hlp (h:t) lst_tmp = reverse_hlp t (h:lst_tmp)

