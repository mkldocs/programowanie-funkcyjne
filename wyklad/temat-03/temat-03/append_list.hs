append_list :: [a] -> [a] -> [a]
append_list lst [] = [lst]
append_list (h:t) = h : (append_list lst t)
