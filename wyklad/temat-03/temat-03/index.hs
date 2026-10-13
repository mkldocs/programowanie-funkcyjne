import Prelude hiding ((!!))

[] !!  _ = error "index error"
(h:_) !! 0 = h
(h:t) !! n
    | n < 1     = error "index error"
    | otherwise = t !! (n - 1)
