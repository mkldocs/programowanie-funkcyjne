def factorial(n):
    """Oblicza silnię liczby n."""
    i = 0
    result = 1

    while i < n:
        i += 1
        result *= i
        
    return result