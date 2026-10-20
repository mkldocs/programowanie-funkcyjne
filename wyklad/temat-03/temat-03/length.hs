length :: [a] -> Int
length [] = 0
length (_:t) = 1 + length t
