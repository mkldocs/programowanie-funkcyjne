import Prelude hiding ((!!))

-- Operatory definiujemy w taki sam sposób jak inne funkcje:
-- (!!) []  _ = error "index error"
-- (!!) (h:_) 0 = h
-- (!!) (h:t) n
--     | n < 1     = error "index error"
--     | otherwise = t !! (n - 1)

-- Nie tylko przy wywołaniu, ale również w definicji możemy użyć składni infiksowej:
[] !!  _ = error "index error"
(h:_) !! 0 = h
(h:t) !! n
    | n < 1     = error "index error"
    | otherwise = t !! (n - 1)
