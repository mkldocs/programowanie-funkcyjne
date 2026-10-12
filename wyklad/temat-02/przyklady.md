# Dodatkowe przykłady użycia rekurencji ogonowej

## Ciąg Fibonacciego

Iteracyjna wersja funkcji obliczającej zadany wyraz ciągu Fibonacciego w Pythonie:

```{literalinclude} temat-02/fibonacci.py
:lang:python
```

Wersja rekurencyjna, ale bez rekurencji ogonowej:
```{literalinclude} temat-02/fibonacci.hs
:lang:haskell
```

Problem z tą wersją jest znacznie większy niż tylko złożoność pamięciowa związana z wykorzystaniem stosu. Tu dużo większym problemem jest złożoność czasowa wynikająca z wielokrotnego liczenia tego samego.

Wizualizacja wykonania wg. tej definicji (z `f` zamiast `fibonacci`):

```
f 6
f 4 + f 5
(f 2 + f 3) + f 5
((f 0 + f 1) + f 3) + f 5
((0 + f 1) + f 3) + f 5
((0 + 1) + f 3) + f 5
(1 + f 3) + f 5
(1 + (f 1 + f 2)) + f 5
(1 + (1 + f 2)) + f 5
(1 + (1 + (f 0 + f 1))) + f 5
(1 + (1 + (0 + f 1))) + f 5
(1 + (1 + (0 + 1))) + f 5
(1 + (1 + 1)) + f 5
(1 + 2) + f 5
3 + f 5
3 + (f 3 + f 4)
3 + ((f 1 + f 2) + f 4)
3 + ((1 + f 2) + f 4)
3 + ((1 + (f 0 + f 1)) + f 4)
3 + ((1 + (0 + f 1)) + f 4)
3 + ((1 + (0 + 1)) + f 4)
3 + ((1 + 1) + f 4)
3 + (2 + f 4)
3 + (2 + (f 2 + f 3))
3 + (2 + ((f 0 + f 1) + f 3))
3 + (2 + ((0 + f 1) + f 3))
3 + (2 + ((0 + 1) + f 3))
3 + (2 + (1 + f 3))
3 + (2 + (1 + (f 1 + f 2)))
3 + (2 + (1 + (1 + f 2)))
3 + (2 + (1 + (1 + (f 0 + f 1))))
3 + (2 + (1 + (1 + (0 + f 1))))
3 + (2 + (1 + (1 + (0 + 1))))
3 + (2 + (1 + (1 + 1)))
3 + (2 + (1 + 2))
3 + (2 + 3)
3 + 5
```

Możemy policzyć ile razy wywoływana jest funkcja `f` dla argumentów `4`, `3`, `2` i `1`:
- `f 4` &mdash; 2 razy,
- `f 3` &mdash; 3 razy,
- `f 2` &mdash; 5 razy,
- `f 1` &mdash; 8 razy.

Można zauważyć, że wartości te są kolejnymi elementami ciągu Fibonacciego. Jest to zrozumiałe, bo np. żeby policzyć ile razy zostanie użyte `f 1` przy liczeniu `f n` musimy policzyć ile razy zostanie użyte przy liczeniu `f (n - 1)` i ile razy przy liczeniu `f (n - 2)`. Przy liczeniu `f 0` wyrażenie `f 1` zostanie użyte 0 razy, a przy liczeniu `f 1` &mdash; oczywiście raz. Czyli liczba wywołań `f 1` przy liczeniu `f n` to wartość *n*-tego wyrazu ciągu Fibonacciego. Wynika z tego, że podczas liczenia `f 30` samo wywołanie `f 1` zostanie wykonane prawie milion razy (dokładnie 832040).


Wersja z rekurencją ogonową:
```{literalinclude} temat-02/fibonacci_tr.hs
```

Wizualizacja wykonania:
```
fibonacci 6
fibonacci_hlp 6 0 1 1
fibonacci_hlp 6 1 1 2
fibonacci_hlp 6 1 2 3
fibonacci_hlp 6 2 3 4
fibonacci_hlp 6 3 5 5
fibonacci_hlp 6 5 8 6
8
```
