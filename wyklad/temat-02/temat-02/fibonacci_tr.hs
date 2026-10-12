fibonacci 0 = 0
fibonacci n = fibonacci_hlp n 0 1 1

fibonacci_hlp n fp f i =
    if i < n then
        fibonacci_hlp n f (fp + f) (i + 1)
    else f
