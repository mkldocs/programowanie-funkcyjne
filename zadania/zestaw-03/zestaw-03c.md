# Listy dwuwymiarowe
**Tematy:** listy dwuwymiarowe

---

(2d-lists)=
## Zadanie 1. Listy dwuwymiarowe

Listy dwuwymiarowe są po prostu listami list. Dla uproszczenia w poniższym zadaniu będzie używana terminologia z operacji na macierzach. Lista będąca elementem listy dwuwymiarowej będzie nazywana **wierszem**, a o elementach leżących na tej samej pozycji w jednym z wierszy (nawet jeżeli nie wszystkie wiersze mają element na tej pozycji) będziemy mówili, że tworzą **kolumnę**. Np. w liście

```haskell
[[1,2],[3,4,5,6],[],[7,8,9]]
```

wiersz o indeksie 1 to lista `[3,4,5,6]`, a kolumnę o indeksie 1 tworzą elementy `2`, `4` i `8`.

### Zadanie 1.1. Dostęp i modyfikacja pojedynczych elementów listy dwuwymiarowej

1. Zdefiniuj funkcję do wzięcia elementu zadanego dwoma indeksami (numer wiersza, numer kolumny) oraz funkcję do modyfikacji elementu na zadanej pozycji (dwa indeksy i nowa wartość):

    ```haskell
    getElement2D :: Int -> Int -> [[a]] -> a
    setElement2D :: Int -> Int -> a -> [[a]] -> [[a]]
    ```

    **Przykład użycia:**

    ```haskell
    ghci> getElement2D 0 1 [[3,4,2,1],[],[3,3,1],[3,8]]
    4

    ghci> setElement2D 2 1 999 [[3,4,2,1],[],[3,3,1],[3,8]]
    [[3,4,2,1],[],[3,999,1],[3,8]]
    ```

### Zadanie 1.2. Dwuwymiarowe wersje `take` i `drop`

Napisz funkcje będące dwuwymiarowymi odpowiednikami standardowych funkcji `take` oraz `drop`.

2. Zdefiniuj funkcje zostawiajace lub odrzucające określoną liczbę kolumn z listy dwuwymiarowej:

    ```haskell
    takeCols :: Int -> [[a]] -> [[a]]
    dropCols :: Int -> [[a]] -> [[a]]
    ```

    **Przykłady użycia:**

    ```haskell
    ghci> takeCols 2 [[1,2,3],[4],[5,6,7,8]]
    [[1,2],[4],[5,6]]

    ghci> dropCols 2 [[1,2,3,4],[],[5],[6,7,8,9,10],[11,12]]
    [[3,4],[],[],[8,9,10],[]]
    ```

3. Zdefiniuj funkcje pobierające lub odrzucające określoną liczbę wierszy oraz kolumn (pierwszy argument to liczba wierszy, drugi to liczba kolumn:

    ```haskell
    take2D :: Int -> Int -> [[a]] -> [[a]]
    drop2D :: Int -> Int -> [[a]] -> [[a]]
    ```

    **Przykłady użycia:**

    ```haskell
    ghci> take2D 3 2 [[1,2,3],[],[4,5,6,7,8],[7,8,9]]
    [[1, 2],[],[4,5]]

    ghci> drop2D 1 2 [[1,2,3], [4,5,6],[7,8]]
    [[6],[]]
    ```

4. Zdefiniuj funkcje pobierające lub odrzucające określoną liczbę początkowych wierszy z listy dwuwymiarowej:

    ```haskell
    takeRows :: Int -> [[a]] -> [[a]]
    dropRows :: Int -> [[a]] -> [[a]]
    ```

    **Pytanie do przemyślenia:**
    Czy do pobrania (lub odrzucenia) pierwszych $n$ list (wierszy) potrzebujesz pisać zupełnie nową implementację? Zastanów się, czy wystarczy użyć zwykłej funkcji `take` (lub `drop`), wymuszając jedynie odpowiednią sygnaturę określającą, że argumentem jest lista dwuwymiarowa.

### Zadanie 1.3. Modyfikacja list dwuwymiarowych

Zaimplementuj poniższe funkcje modyfikujące listy dwuwymiarowe. Możesz założyć, że podane indeksy są poprawne (funkcje mogą ignorować błędy związane z wyjściem poza zakres i np. pomijać nadmiarowe elementy). Indeksujemy od zera.

1. Zastąpienie wszystkich elementów w zadanym wierszu nową wartością:

    ```haskell
    fillRow :: Int -> a -> [[a]] -> [[a]]
    ```

    **Przykład użycia:**

    ```haskell
    ghci> fillRow 2 999 [[3,4,2,1],[],[3,3,1],[3,8]]
    [[3,4,2,1],[],[999,999,999],[3,8]]
    ```

2. Zastąpienie wszystkich elementów w kolunnie nową wartością:

    ```haskell
    fillColumn :: Int -> a -> [[a]] -> [[a]]
    ```

    **Przykład użycia:**

    ```haskell
    ghci> fillColumn 2 999 [[3,4,2,1],[],[3,3,1],[3,8]]
    [[3,4,999,1],[],[3,3,999],[3,8]]
    ```

3. Wymiana elementów na zadanej pozycji w kolejnych listach na odpowiednie wartości z zadanej listy (jeżeli w liście wartości jest więcej elementów niż list składowych, ignoruj nadmiarowe; jeżeli mniej &mdash; podmień tylko te, które mają odpowiedniki):

    ```haskell
    replaceInColumn :: Int -> [a] -> [[a]] -> [[a]]
    ```

    **Przykład użycia:**

    ```haskell
    ghci> replaceInColumn 1 [40,30,20,10] [[1,2,3,4],[5,6,7,8],[9],[10,11]]
    [[1,40,3,4],[5,30,7,8],[9],[10,10]]
    ```
---

(matrix-validation-reading)=

## Zadanie 2. Macierze

### Zadanie 2.1. Macierze &mdash; walidacja i odczyt danych

Macierze można reprezentować jako listy dwuwymiarowe. Jeśli w danym zadaniu nie wskazano inaczej, funkcje nie muszą sprawdzać poprawności rozmiarów macierzy. Indeksy liczone są od zera.

Napisz następujące funkcje:

1. `isValidMatrix :: [[a]] -> Bool` &mdash; sprawdza, czy lista jest poprawną macierzą (ma co najmniej jeden wiersz, każdy wiersz ma co najmniej jeden element, a wszystkie wiersze są tej samej długości).
2. `matrixElement :: Int -> Int -> [[a]] -> a` &mdash; zwraca element z $m$-tego wiersza i $n$-tej kolumny.
3. `matrixColumn :: Int -> [[a]] -> [a]` &mdash; zwraca $n$-tą kolumnę macierzy jako listę.
4. `matrixDiagonal :: [[a]] -> [a]` &mdash; zwraca przekątną (elementy, których indeks wiersza i macierzy jest równy) macierzy jako listę.
5. `matrixSum :: Num a => [[a]] -> a` &mdash; oblicza sumę wszystkich elementów macierzy.

#### Przykłady użycia

```haskell
ghci> isValidMatrix []
False
ghci> isValidMatrix [[1],[2]]
True
ghci> isValidMatrix [[1,2,3],[4,5,6],[7,8]]
False

ghci> matrixElement 1 2 [[1,2,3],[4,5,6],[7,8,9]] 
6

ghci> matrixColumn 2 [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
[3,7,11]

ghci> matrixDiagonal [[1,2,3],[4,5,6],[7,8,9]]
[1,5,9]

ghci> matrixSum [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]
120
```

---

(matrix-generation)=
### Zadanie 2.2. Generowanie macierzy

Napisz zestaw funkcji tworzących macierze o zadanym rozmiarze:

1. `zeroMatrix :: Num a => Int -> Int -> [[a]]` &mdash; tworzy macierz $m \times n$ złożoną z samych zer.
2. `constantMatrix :: a -> Int -> Int -> [[a]]` &mdash; tworzy macierz $m \times n$ wypełnioną zadaną wartością.
3. `identityMatrix :: Num a => Int -> [[a]]` &mdash; tworzy jednostkową macierz kwadratową $n \times n$.
4. `matrixFromFunction :: (Int -> Int -> a) -> Int -> Int -> [[a]]` &mdash; tworzy macierz $m \times n$, w której wartość elementu w wierszu $i$ oraz kolumnie $j$ wyznaczana jest przez wartość zadanej funkcji $f(i, j)$.

#### Przykłady użycia

```haskell
ghci> zeroMatrix 3 4
[[0,0,0,0],[0,0,0,0],[0,0,0,0]]

ghci> constantMatrix 4.5 3 1
[[4.5],[4.5],[4.5]]

ghci> identityMatrix 4
[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]

ghci> matrixFromFunction (\x y -> 100 * x + y) 3 4
[[0,1,2,3],[100,101,102,103],[200,201,202,203]]

ghci> matrixFromFunction (\x y -> if x == y then 1 else 0) 3 3
[[1,0,0],[0,1,0],[0,0,1]]

```

---

(matrix-arithmetic)=
### Zadanie 2.3. Arytmetyka macierzy

Napisz funkcje realizujące operacje algebraiczne na macierzach. Rozmiary macierzy podawanych jako argumenty mogą być traktowane jako poprawne.

1. `scalarMultiply :: Num a => a -> [[a]] -> [[a]]` &mdash; mnoży każdy element macierzy przez zadaną liczbę.
2. `addMatrices :: Num a => [[a]] -> [[a]] -> [[a]]` &mdash; oblicza sumę dwóch macierzy.
3. `transposeMatrix :: [[a]] -> [[a]]` &mdash; zwraca transpozycję macierzy (zamienia wiersze z kolumnami).
4. `multiplyMatrices :: Num a => [[a]] -> [[a]] -> [[a]]` &mdash; (*) realizuje mnożenie dwóch macierzy.

#### Przykłady użycia

```haskell
ghci> addMatrices [[1,2],[3,4]] [[10,20],[30,40]]
[[11,22],[33,44]]

ghci> scalarMultiply 10 [[1,2],[3,4]]
[[10,20],[30,40]]

ghci> transposeMatrix [[1,2,3],[4,5,6]]
[[1,4],[2,5],[3,6]]

ghci> multiplyMatrices [[1,2],[3,4]] [[2,0],[1,2]]
[[4,4],[10,8]]

```