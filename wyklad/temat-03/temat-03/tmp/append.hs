append :: a -> [a] -> [a]
append x [] = [x]
append x (h:t) = h : (append x t)

rotate [] = []
rotate (h:t) = append t h