sign x
    | x < 0     = -1
    | x == 0    = 0
    | otherwise = 1

leapYear y
    | mod y 400 == 0 = True
    | mod y 100 == 0 = False
    | mod y 4 == 0   = True
    | otherwise      = False

daysInMonth _ 1 = 31
daysInMonth y 2
    | leapYear y = 29
    | otherwise  = 28
daysInMonth _ 3 = 31
daysInMonth _ 4 = 30
daysInMonth _ 5 = 31
daysInMonth _ 6 = 30
daysInMonth _ 7 = 31
daysInMonth _ 8 = 31
daysInMonth _ 9 = 30
daysInMonth _ 10 = 31
daysInMonth _ 11 = 30
daysInMonth _ 12 = 31


numberOfSolutions a b c
    | delta < 0     = 0
    | delta == 0    = 1
    | otherwise     = 2
    where
        delta = b ^ 2 - 4 * a * c


numberOfSolutions' a b c =
    let
        delta = b ^ 2 - 4 * a  *c
    in
        if delta < 0 then 0
        else
            if delta == 0 then 1
            else 2


f 0 = 0
f (-1) = 1
f 1 = 2
f x = x^2 - 1
