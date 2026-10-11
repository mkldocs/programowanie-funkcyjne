-- def factorial(n):
--     """Oblicza silnię liczby n."""
--     i = 0
--     result = 1
--     while i < n:
--         i += 1
--         result *= i
--     return result

factorial 0 = 1
factorial n = n * factorial (n - 1)

factorial' n = factorial_hlp n 0 1

factorial_hlp n i result =
    if i < n then
        factorial_hlp n (i + 1) (result * (i + 1))
    else
        result

-- factorial 3
-- 3 * factorial 2
-- 3 * 2 * factorial 1
-- 3 * 2 * 1 * factorial 0
-- 3 * 2 * 1 * 1
-- 3 * 2 * 1
-- 3 * 2
-- 6

-- factorial' 3
-- factorial_hlp 3 0 1
-- factorial_hlp 3 1 1
-- factorial_hlp 3 2 2
-- factorial_hlp 3 3 6
-- 6




-- def fibonacci(n):
--     """Oblicza n-ty wyraz ciągu Fibonacciego."""
--     if n == 0:
--         return 0
--     fp, f = 0, 1
--     i = 1
-----
--     while i < n:
--         fp, f = f, fp + f
--         i += 1
--     return f

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 2) + fibonacci (n - 1)

fibonacci' 0 = 0
fibonacci' n = fibonacci_hlp n 0 1 1

fibonacci_hlp n fp f i =
    if i < n then
        fibonacci_hlp n f (fp + f) (i + 1)
    else
        f



-- Przykładowa funkcja
f x =
    if x < 10 then
        2.0 ** 30
    else
        1 / (2 ** 20)

-- def kahan_sum(n):
--     """Algorytm Kahana do sumowania liczb zmiennoprzecinkowych."""
--     total = 0.0
--     c = 0.0
--     i = 0
--     while i < n:
--         y = f(i) - c
--         t = total + y
--         c = t - total - y
--         total = t
--         i += 1
--     return total
