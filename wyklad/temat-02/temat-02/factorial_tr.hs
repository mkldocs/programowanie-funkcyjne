factorial n = factorial_hlp n 0 1

factorial_hlp n i result =
    if i < n then
        factorial_hlp n (i + 1) (result * (i + 1))
    else
        result
