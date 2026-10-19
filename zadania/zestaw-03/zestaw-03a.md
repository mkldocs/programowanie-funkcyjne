# Listy: wzorce, prosta rekurencja

**Tematy:** listy, dopasowanie wzorców, rekurencja

---

(pattern-matching-lists)=
##  Zadanie 1. Proste operacje na listach za pomocą dopasowania wzorców

Zdefiniuj poniższe funkcje, wykorzystując dopasowanie wzorców (bez użycia rekurencji). Pamiętaj o uwzględnieniu przypadków brzegowych (np. pusta lista, lista z jednym elementem).

1. Pierwszy element listy lub zero, jeżeli lista jest pusta:
```haskell
firstElement :: [Int] -> Int
```


2. Sprawdzenie, czy lista zawiera co najmniej cztery elementy:
```haskell
atLeastFour :: [a] -> Bool
```


3. Suma trzech pierwszych elementów listy (brakujące elementy traktuj jako `0`):
```haskell
sumFirstThree :: [Int] -> Int
```


4. Suma drugiego i czwartego elementu listy (brakujące elementy traktuj jako `0`):
```haskell
sumSecondFourth :: [Int] -> Int
```

5. Utworzenie listy składającej się z pierwszego, trzeciego i piątego elementu podanej listy (lub odpowiednio krótszej, jeżeli lista zawiera mniej elementów):
```haskell
firstThirdFifthList :: [a] -> [a]
```

6. Zwracanie drugiego elementu listy; jeżeli go nie ma &mdash; pierwszego, a jeśli lista jest pusta &mdash; podanej wartości domyślnej:
```haskell
secondOrFirstOrDefault :: [a] -> a -> a
```


7. Usunięcie ewentualnego nieparzystego elementu z początku listy (jeśli pierwszy element jest parzysty lub lista jest pusta, zwróć ją bez zmian):
```haskell
removeOddHead :: [Int] -> [Int]
```


8. Usunięcie pierwszego elementu z listy tylko wtedy, gdy dwa pierwsze elementy są ujemne:
```haskell
removeFirstIfBothNegative :: [Int] -> [Int]
```

### Przykłady użycia

```haskell
ghci> firstElement [1, 2, 3]
1
ghci> firstElement []
0

ghci> atLeastFour [1, 2, 3, 4]
True
ghci> atLeastFour [1, 2, 3]
False

ghci> sumFirstThree [1, 2, 3, 4]
6
ghci> sumFirstThree [1]
1

ghci> sumSecondFourth [1, 2, 3, 4, 5]
6
ghci> sumSecondFourth [1]
0

ghci> firstThirdFifthList []
[]
ghci> firstThirdFifthList [9, 2]
[9]
ghci> firstThirdFifthList [9, 8, 7, 6]
[9, 7]
ghci> firstThirdFifthList [9, 8, 7, 6, 5, 4, 3, 2]
[9, 7, 5]

ghci> secondOrFirstOrDefault [1, 2, 3] 0
2
ghci> secondOrFirstOrDefault [1] 0
1
ghci> secondOrFirstOrDefault [] 0
0

ghci> removeOddHead [1, 2, 3, 4]
[2,3,4]
ghci> removeOddHead [2, 3, 4]
[2,3,4]

ghci> removeFirstIfBothNegative [-1, -2, 3, 4]
[-2,3,4]
ghci> removeFirstIfBothNegative [-1, 2, 3, 4]
[-1,2,3,4]
```

---

(list-reimplementation)=
## Zadanie 2. Implementacja standardowych funkcji z modułu Prelude

Napisz własne wersje następujących funkcji ze standardowego modułu `Prelude`.

Aby uniknąć konfliktów nazw, ukryj funkcje z `Prelude`:

```haskell
import Prelude hiding (length, sum, product, elem, reverse, concat, take, drop, replicate, zip, (++), (!!))

```

Zaimplementuj następujące funkcje:

```haskell
length :: [a] -> Int
sum :: Num a => [a] -> a
product :: Num a => [a] -> a
elem :: Eq a => a -> [a] -> Bool
(++) :: [a] -> [a] -> [a]
concat :: [[a]] -> [a]
reverse :: [a] -> [a]
take :: Int -> [a] -> [a]
drop :: Int -> [a] -> [a]
replicate :: Int -> a -> [a]
zip :: [a] -> [b] -> [(a, b)]
(!!) :: [a] -> Int -> a
```

**Uwagi:**
- Niektóre z tych funkcji mają w `Prelude` inną, bardziej ogólną sygnaturę, umożłiwiającą operacje na innych niż listy strukturach danych.
- Zwróć uwagę na złożoność zaimplementowanych funkcji (w szczególności na złożoność `reverse`).

### Przykłady użycia

```haskell
ghci> length [1, 2, 3]
3

ghci> reverse [5, 6, 7]
[7,6,5]

ghci> ['a', 'b'] ++ "cde"
"abcde"

ghci> concat [[1, 2], [], [3, 4, 5], [6]]
[1,2,3,4,5,6]

ghci> take 2 [1, 2, 3, 4]
[1,2]

ghci> replicate 3 'a'
"aaa"

ghci> zip [1, 2] ['a', 'b', 'c']
[(1,'a'),(2,'b')]

ghci> [10, 20, 30] !! 1
20

```

---

(list-processing)=

## Zadanie 3. Modyfikowanie i filtrowanie list

Napisz funkcje realizujące następujące operacje na listach:

### 3.1. Zliczanie i filtrowanie elementów

* `countOccurrences :: Eq a => a -> [a] -> Int` &mdash; zlicza liczbę wystąpień danego elementu w liście.
* `countInRange :: Ord a => a -> a -> [a] -> Int` &mdash; zlicza elementy z zadanego obustronnie domkniętego przedziału, którego końce zadane są parametrami.
* `everySecondFromFirst :: [a] -> [a]` &mdash; zwraca co drugi element listy, zaczynając od pierwszego.
* `everySecondFromSecond :: [a] -> [a]` &mdash; zwraca co drugi element listy, zaczynając od drugiego.

### 3.2. Modyfikacja elementów

* `removeElement :: Eq a => a -> [a] -> [a]` &mdash; usuwa wszystkie wystąpienia danego elementu z listy.
* `replaceElement :: Eq a => a -> a -> [a] -> [a]` &mdash; zastępuje w liście wszystkie wystąpienia pierwszego argumentu przez wartość zadaną drugim argumentem.
* `setElement :: Int -> a -> [a] -> [a]` &mdash; zastępuje element pod podanym indeksem (numerowanym od 0) nową wartością.

(remove-zeros)= 
### 3.3. Przycinanie zer i sekwencji końcowych

* `removeLeadingZeros :: (Num a, Eq a) => [a] -> [a]` &mdash; usuwa początkowe zera z listy.
* `removeTrailingZeros :: (Num a, Eq a) => [a] -> [a]` &mdash; usuwa końcowe zera z listy.
* `removeTrailing :: Eq a => a -> [a] -> [a]` &mdash; usuwa z końca listy wszystkie wystąpienia zadanego elementu.

### 3.4. Podział listy

* `partitionOddsEvens :: [Int] -> ([Int], [Int])` &mdash; rozdziela listę liczb całkowitych na krotkę dwóch list: elementów parzystych i nieparzystych, zachowując ich oryginalną kolejność.

### Przykłady użycia

```haskell
ghci> everySecondFromFirst [9, 8, 7, 6, 5, 4, 3, 2]
[9,7,5,3]

ghci> everySecondFromSecond [1, 2, 3, 4, 5, 6, 7]
[2,4,6]

ghci> removeElement 5 [1, 2, 5, 3, 3, 5, 5]
[1,2,3,3]

ghci> replaceElement 5 9 [1, 2, 5, 3, 3, 5, 5]
[1,2,9,3,3,9,9]

ghci> setElement 4 'a' "qwerty"
"qweray"

ghci> removeTrailingZeros [2, 3, 0, 1, 0, 0]
[2,3,0,1]

ghci> removeTrailing 4 [2, 3, 4, 4, 4]
[2,3]
ghci> removeTrailing 5 [2, 3, 4, 4, 4]
[2,3,4,4,4]

ghci> partitionOddsEvens [1, 2, 4, 3, 4, 7, 2]
([2,4,4,2],[1,3,7])

```

---

(string-operations)=

## Zadanie 4. Operacje na napisach

Napisy w Haskellu są listami znaków (`String` jest aliasem dla `[Char]`). Zdefiniuj następujące funkcje operujące na napisach:

### 4.1. Prefiksy i sufiksy

* `startsWith :: String -> String -> Bool` &mdash; sprawdza, czy napis zaczyna się od podanego prefiksu.
* `endsWith :: String -> String -> Bool` &mdash; sprawdza, czy napis kończy się podanym sufiksem.

### 4.2. Wyszukiwanie podnapisu

* `findSubstr :: String -> String -> Int` &mdash; zwraca indeks pierwszego wystąpienia podnapisu w danym napisie lub `-1`, jeżeli podnapis nie występuje.

### 4.3. Łączenie napisów

* `join :: String -> [String] -> String` &mdash; łączy listę napisów podanym separatorem.

### Przykłady użycia

```haskell
ghci> startsWith "kat" "katastrofa"
True

ghci> endsWith "ska" "Kowalska"
True

ghci> findSubstr "nie" "maniek"
2

ghci> findSubstr "kot" "pies"
-1

ghci> join ", " ["apple", "pineapple", "banana"]
"apple, pineapple, banana"

```

---

(range)=
## Zadanie 5. Generowanie zakresów w stylu Pythona

Napisz funkcje generujące listy liczb całkowitych wzorowane na funkcji `range` z języka Python:

```haskell
range1 :: Int -> [Int]
range2 :: Int -> Int -> [Int]
range3 :: Int -> Int -> Int -> [Int]

```

Opis działania:

* `range1 stop` &mdash; generuje listę od `0` do `stop - 1`.
* `range2 start stop` &mdash; generuje listę od `start` do `stop - 1`.
* `range3 start stop step` &mdash; generuje listę od `start` do `stop - 1` z krokiem `step`.

#### Przykłady użycia

```haskell
ghci> range1 5
[0,1,2,3,4]

ghci> range2 2 5
[2,3,4]

ghci> range3 3 12 2
[3,5,7,9,11]

```

---
(insert-sort)=
## Zadanie 6. Sortowanie przez wstawianie

Napisz funkcję:

```haskell
insert :: Ord a => a -> [a] -> [a]

```

która przyjmuje posortowaną rosnąco listę oraz element i wstawia go w odpowiednie miejsce, zachowując porządek sortowania.

Zaimplementuj algorytm sortowania przez wstawianie:

```haskell
insertionSort :: Ord a => [a] -> [a]

```

wykorzystując funkcję `insert`.

#### Przykłady użycia

```haskell
ghci> insert 7 [1, 4, 8]
[1,4,7,8]

ghci> insertionSort [5, 2, 9, 3, 1]
[1,2,3,5,9]
```

---

(list-means)=
## Zadanie 7. Średnie z elementów listy

Napisz funkcje obliczające odpowiednie średnie z listy liczb zmiennoprzecinkowych:

```haskell
arithmeticMean :: Floating a => [a] -> a
geometricMean :: Floating a => [a] -> a
harmonicMean :: Floating a => [a] -> a
```

**Wzory na średnie**:

* Średnia arytmetyczna: $\frac{\sum x_i}{n}$
* Średnia geometryczna: $\sqrt[n]{\prod x_i}$
* Średnia harmoniczna: $\frac{n}{\sum \frac{1}{x_i}}$

### Uwaga:

Zaimplementuj funkcje tak, aby każda średnia była obliczana przy użyciu **jednego przebiegu listy** (np. wyznaczając jednocześnie długość listy i sumę/iloczyn elementów w funkcji pomocniczej zwracającej krotkę), zamiast osobnego przechodzenia listy dla długości i osobnego dla sumy.