# Algorytmy iteracyjne i rekurencja

## Rekurencja ogonowa

**Rekurencja ogonowa** (ang. *tail recursion*) polega na tym, że wywołania rekurencyjne są **wywołaniami ogonowymi** (ang. *tail calls*). Jeżeli ostatnią operacją wykonywaną przez funkcję jest wywołanie innej funkcji (lub tej samej, w przypadku rekurencji), to jest to wywołanie ogonowe. W języku funkcyjnym: wartość funkcji zostanie obliczona bezpośrednio jako wartość zwrócona przez wartość innej funkcji.

Przykład:

```haskell
f1 x = g (x + 1)

f2 x = 
    if x < 0 then
        f2 (x + 1)
    else
        1 - (g x)

f3 x y = g (h x)
```

- W definicji `f1` wywołanie funkcji `g` jest ogonowe.
- W definicji `f2` wywołanie `f2` jest ogonowe (rekurencja ogonowa), a wywołanie `g` nie jest (po jego zakończeniu musi być ).
- W definicji `f3` wywołanie `g` jest ogonowe, a wywołanie `h` nie jest.
- **Uwaga:** w definicji funkcji `f2` jest jeszcze jedno wywołanie ogonowe, jest to wywołanie funkcji `(-)`, czyli operatora odejmowania.

Rekurencja ogonowa pozwala na wyrażenie w językach funkcyjnych algorytmów iteracyjnych.

(tco)=
## Optymalizacja wywołań ogonowych

Przy wywołaniu ogonowym przechowywane na stosie dane dotyczące bieżącego wywołania (np. wartości zmiennych lokalnych) przestają być potrzebne i mogą być zastąpione przez dane związane z wywołaniem ogonowym. Jeżeli na stosie przechowywany był np. adres powrotu dla bieżącego wywołania, to nowe wywołanie nie potrzebuje dodatkowego adresu powrotu, tylko używa poprzedniego.

Przykład:
```haskell
f a b = ...

f x y z =
    if ...
        ...
    else
        g (x + 1) (y + z)
```

Przy obliczaniu wartości wyrażenia `100 + f 3 4 5` w momencie wywołania funkcj `f`, na stosie odłożone zostaną informacje o wartościach zmiennych `x`, `y` i `z` (odpowiednio `3`, `4` i `5`) oraz informacja potrzebna do kontynuowania obliczeń po zakończeniu działania funkcji `f`. Ta informacja to właśnie tzw. *adres powrotu*. Dzięki niemu wiadomo, że teraz należy otrzymaną wartość dodać do 100.

W momencie wywołania funkcji `g` informacja o wartościach `x`, `y` i `z` przestaje być potrzebna i może być zastąpiona informacją o wartościach `a` i `b` (`4` i `9`). Po zakończeniu tego wywołania, jego wynik będzie użyty bezpośrednio jako wynik poprzedniego wywołania `f`. Czyli program przechodzi bezpośrednio do dodania tego wyniku do 100. Adres powrotu tego wywołania `g` jest adresem powrotu wywołania `f`. Nie jest na stosie potrzebna żadna dodatkowa informacja.

Mechanizm ten nazywa się **optymalizacją wywołań ogonowych** (ang. *TCO*, *tail call optimization*).

## Zapis algorytmu iteracyjnego za pomocą rekurencji ogonowej

Iteracyjna implementacja obliczania silni w Pythonie:

```{literalinclude} temat-02/factorial.py
:lang:python
:linenos:
```

Ta wersja nie używa żadnych dodatkowych wywołań funkcji. Na stosie przechowywane są wyłącznie wartości `n`, `i` oraz `result`.

Implementacja silni w Haskellu bezpośrednio z definicji:
```{literalinclude} temat-02/factorial.hs
:lang:haskell
```

Wykonanie `factorial 4` możemy sobie w uproszczeniu zwizualizować tak:

```
factorial 4
4 * factorial 3
4 * 3 * factorial 2
4 * 3 * 2 * factorial 1
4 * 3 * 2 * 1 * factorial 0
4 * 3 * 2 * 1 * 1
4 * 3 * 2 * 1
4 * 3 * 2
4 * 6
24
```

W momencie wywołania `factorial 0` wartości `4`, `3`, `2` i `1` są potrzebne do dalszych obliczeń i niezależnie od optymalizacji muszą być przechowywane. Oznacza to liniową złożoność pamięciową (potrzebna ilość pamięci jest proporcjonalna do `n`).


Spróbujmy teraz stworzyć implementację odpowiadającą iteracyjnej wersji (z pętlą) używając rekurencji ogonowej.

W wierszu 5 implementacji iteracyjnej dalszy przebieg obliczeń zależy wyłącznie od wartości `n`, `i` oraz `result`. Możemy zatem zapisać go jako funkcję pomocniczą z parametrami `n`, `i` oraz `result`:
```haskell
factorial_hlp n i result = ...
```

Wykonanie pętli polega na sprawdzeniu warunku
```haskell
if i < n then
```
 a następnie:
- jeżeli jest spełniony, to wykonujemy *refren pętli* i wracamy w to samo miejsce,
- znowu jesteśmy w wierszu 5, czyli realizacja dalszych obliczeń wyrażona jest znowu funkcją `factorial_hlp`, ale poprzednie wartości `n`, `i` i `result` zostały zastąpione odpowiednio przez `n` (ta wartość się nie zmieniła), `i + 1` oraz `result * (i + 1)`,
- daje to wywołanie
```haskell
    factorial_hlp n (i + 1) (result * (i + 1))
```
- jeżeli warunek nie jest spełniony, to przechodzimy do instrukcji za pętlą (wiersz 9),
- wynik funkcji będzie obliczony dalszymi instrukcjami (tutaj będzie to `return result`):
```haskell
else result
```

Implementacja `factorial` sprowadza się teraz do wywołania funkcji pomocniczej z odpowiednimi wartościami:
```haskell
factorial n = factorial_hlp n 0 1
```

Ostatecznie otrzymujemy:

```{literalinclude} temat-02/factorial_tr.hs
:lang:haskell
```

Teraz wykonanie `factorial 4` można sobie zwizualizować tak:
```
factorial 4
factorial_hlp 4 0 1
factorial_hlp 4 1 1
factorial_hlp 4 2 2
factorial_hlp 4 3 6
factorial_hlp 4 4 24
24
```

Taki model wykonania w połączeniu z [optymalizacją wywołań ogonowych](#tco) oznacza, że ilość potrzebnej pamięci nie jest zależna od wartości `n`. Oznacza to stałą złożoność pamięciową (tak samo jak w implementacji iteracyjnej w Pythonie).