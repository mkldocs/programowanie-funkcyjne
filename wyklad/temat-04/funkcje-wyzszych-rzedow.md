# Funkcje wyższych rzędów

## Motywacja

### Funkcja jako argument funkcji
**Przykład 1: wykonanie tej samej operacji na każdym elemencie listy**
- Zwiększenie o jeden każdego element listy:
    ```haskell
    listAddOne :: Num a :: [a] -> [a]
    listAddOne [] = []
    listAddOne (h:t) = (h + 1) : listAddOne t
    ```
- Podniesienie do kwadratu każdego elementu listy:
    ```haskell
    listSquare :: Num a :: [a] -> [a]
    listSquare [] = []
    listSquare (h:t) = (h^2) : listSquare t
    ```

Ten wzorzec obliczeń realizowany jest przez funkcję `map`:

```haskell
addOne x = x + 1

listAddOne :: Num a :: [a] -> [a]
listAddOne lst = map addOne lst
```


**Przykład 2: wybór elementów listy spełniających dany warunek**

- Wybranie z listy liczb całkowitych wyłącznie liczb parzystych
- Wybranie z listy napisów napisów o długości większej niż 10

...

Ten wzorzec obliczeń realizowany jest przez funkcję `map`:


#### Funkcje anonimowe

- `\x -> x + 1`
- `\x y -> x + y`

-
    ```
    (\x -> x + 1) 5
    5 + 1
    6
    ```
-
    ```
    (\x y -> x + y) 3 4
    3 + 4
    7
    ```

#### Ile argumentów mogą naprawdę mieć funkcje w Haskellu?

```
\x y -> x + y
```
to skrót od
```
\x -> (\y -> x + y)
```
a
```
f x y
```
oznacza to samo co
```
(f x) y
```
czyli
```
(\x y -> x + y) 3 4
((\x -> (\y -> x + y)) 3) 4
(\y -> 3 + y) 4
3 + 4
7
```
- Co to jest *zmienna wolna* i *zmienna związana*?
    
    - Czy poprawne jest `\x -> (\x -> x + 1)`?

    - A co z `\x x -> x + 1`?

To dotyczy wszystkich funkcji, nie tylko anonimowych.

Przykład:
```haskell
f x y = x^2 + 2 * y
```
Sygnaturą może być np.
```haskell
f :: Double -> Double -> Double
```
To jest dokładnie to samo co:
```haskell
f :: Double -> (Double -> Double)
```
a poniższe definicje są równoważne:
```haskell
f = \x -> (\y -> (x^2 + 2 * y))

f x = \y -> (x^2 + 2 * y)

f x y = x^2 + 2 * y
```

#### Częściowe wywołanie

Czy takie definicje są poprawne? Jeżeli tak, to jakiego typu są `a`, `b` i `c`?
- `a = f`
- `b = f 3`
- `c = f 3 4`

##### Częściowe wywołanie i operatory

- `(+ 1)` to skrót od `\x -> x + 1`
- `(1 +)` to skrót od `\x -> 1 + x`

    **Uwaga:** to jest to samo tylko dla operatorów przemiennych.

Przykład:

Dodanie 1 do wszystkich elementów listy:
```haskell
map (+1) [1..10]
```

```haskell
listAddOne :: Num a :: [a] -> [a]
listAddOne lst = map (+1) lst
```
A czy można jeszcze zapisać to jeszcze krócej?
```haskell
listAddOne :: Num a :: [a] -> [a]
listAddOne = map (+1)
```



### Funkcja zwracająca funkcję

- 

- Przykłady z innych języków

    - `functools.partial` &mdash; brak specjalnej składni, ale dynamiczne typowanie pozwala na pewne rzeczy niemożliwe w Haskellu (łatwe częściowe wywołanie z ustalonym innym parametrem niż pierwszy)