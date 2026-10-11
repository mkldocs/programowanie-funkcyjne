def fibonacci(n):
    """Oblicza n-ty wyraz ciągu Fibonacciego."""
    if n == 0:
        return 0
    fp, f = 0, 1
    i = 1
    while i < n:
        fp, f = f, fp + f
        i += 1
    return f
