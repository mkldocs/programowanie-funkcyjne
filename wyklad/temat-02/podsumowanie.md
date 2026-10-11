# Podsumowanie

## Pojęcia, które trzeba znać i rozumieć

* Wywołanie ogonowe
* Rekurencja ogonowa

## Co trzeba umieć

* Przekształcenie prostego algorytmu iteracyjnego do postaci z rekurencją ogonową

## Ćwiczenia sprawdzające
1. Które wywołania funkcji `f` w poniższej definicji są wywołaniami ogonowymi?

    ```{code} python
    :linenos:
    def g(x):
        if x < 0:
            return f(-x)
        elif x == 0:
            return 4 * f(x)
        elif x < 10:
            y = x + 5
            return f(10 * y)
        else:
            y = f(x)
            return f(y + 5)
    ```

2. Przekształć poniższą definicję na wersję w Haskellu z odpowiednim użyciem rekurencji ogonowej:

    ```python
    def n_sum(n):
        total = 0.0
        i = 0
        while i < n:
            total += f(i)
            i += 1
        return total
    ```
