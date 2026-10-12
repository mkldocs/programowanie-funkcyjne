kahan_sum n = kahan_hlp n 0.0 0.0 0

kahan_hlp n total c i =
    if i < n then
        let
            y = f i - c
            t = total + y
        in
            kahan_hlp n t (t - total - y) (i + 1)
    else total

-- Przykładowa funkcja
f x =
    if x < 10 then
        2.0 ** 30
    else
        1 / (2 ** 20)
