def f(x):
    """Przykładowa funkcja użyta w algorytmie Kahana."""
    if x < 10:
        return 2.0 ** 30
    return 1 / (2 ** 20)


def kahan_sum(n):
    """Algorytm Kahana do sumowania liczb zmiennoprzecinkowych."""
    total = 0.0
    c = 0.0
    i = 0
    while i < n:
        y = f(i) - c
        t = total + y
        c = t - total - y
        total = t
        i += 1
    return total
