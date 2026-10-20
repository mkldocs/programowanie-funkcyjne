import Prelude hiding (reverse)

-- reverse [] = []
-- reverse (h:t) = (reverse t) ++ [h]

reverse lst = reverse_hlp lst []

reverse_hlp [] lst_tmp = lst_tmp
reverse_hlp (h:t) lst_tmp = reverse_hlp t (h:lst_tmp)

