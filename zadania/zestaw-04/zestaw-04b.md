# Funkcje wyższych rzędów: listy


---
(palindromes)=
## Zadanie 1. Palindromy

Palindrom to napis, który czytany od przodu i od tyłu jest taki sam. Przykładem palindromu jest wyraz &bdquo;kajak&rdquo; lub zdanie &bdquo;Może jutro ta dama sama da tortu jeżom&rdquo; (ale w tym przypadku trzeba zignorować wielkość liter i umiejscowienie przerw między wyrazami).

Napisz zestaw funkcji do sprawdzania różnych właściwości palindromów. Postaraj się zaimplementować poniższe zadania w sposób możliwie zwięzły, (np. w tzw. stylu *point-free*, czyli bez jawnego deklarowania argumentów tam, gdzie to możliwe).

Dla pustych list (i pustych napisów) przyjmij, że odpowiednie funkcje zwracają `True` (zgodnie z logiką kwantyfikatorów).

### 1. Sprawdzanie pojedynczego napisu

Napisz funkcję sprawdzającą, czy pojedynczy napis jest palindromem:

```haskell
isPalindrome :: String -> Bool
```

- Spróbuj zdefiniować tę funkcję rekurencyjnie, wykorzystując następującą definicję palindromu:
    
    - Pusty napis jest palindromem.
    - Napis jest palindromem, jeżeli ma taki sam pierwszy i ostatni znak, a napis powstały po usunięciu tych znaków też jest palindromem.

    Do tej implementacji użyj wyłącznie wbudowanych funkcji `head`, `last`, `tail` i `init`.

- Przeanalizuj złożoność czasową takiego rozwiązania. Wypróbuj je dla bardzo długiego napisu (np. wygenerowanego poleceniem `['\0' .. '\20000'] ++ ['\20000', '\19999' .. '\0']`). 
- Spróbuj napisać szybszą (i być może dużo prostszą) wersję używając odpowiednich funkcji z modułu `Prelude`.

**Przykłady użycia:**

```haskell
ghci> isPalindrome "kajak"
True
ghci> isPalindrome "radar"
True
ghci> isPalindrome "hello"
False
ghci> isPalindrome "A to idiota"
False
ghci> isPalindrome "atoidiota"
True
ghci> isPalindrome ""
True
```

#### Ćwiczenie dodatkowe: Normalizacja napisu

Funkcja `isPalindrome` dla argumentu `"A to kanapa pana Kota"` zwróci `False`. Aby mogła poprawnie sprawdzać całe zdania, konieczne jest zignorowanie wielkości liter oraz usunięcie spacji.

Napisz funkcję normalizującą:

```haskell
normalizeString :: String -> String
```

która usunie z napisu wszystkie spacje i zamieni wielkie litery na małe.

**Wskazówka:**
Wykorzystaj moduł `Data.Char` zawierający m\.in. funkcje `toLower` oraz `isSpace`. Zaimplementuj funkcję jako złożenie (operator `.`) standardowych funkcji wyższych rzędów: `map` do zamiany wielkości liter oraz `filter` do odrzucenia spacji. Spróbuj zaimplementować funkcję w stylu *point-free*, czyli bez jawnego deklarowania parametrów.

**Przykłady użycia:**

```haskell
ghci> normalizeString "A to kanapa pana Kota"
"atokanapapanakota"

ghci> isPalindrome $ normalizeString "Może jutro ta dama sama da tortu jeżom"
True

```

### 2. Sprawdzanie listy napisów

Napisz funkcję sprawdzającą, czy napisy na liście są palindromami:

```haskell
allPalindromes :: [String] -> Bool
```

**Wskazówka:**
- Użyj funkcji `all`.

**Przykłady użycia:**

```haskell
ghci> allPalindromes ["kajak","radar","anna"]
True
ghci> allPalindromes ["kajak","hello","anna"]
False
ghci> allPalindromes []
True
ghci> allPalindromes ["a","bb","ccc"]
True
```

### 3. Lista jako palindrom

Napisz funkcję sprawdzającą, czy sama lista napisów jest palindromem (tzn. czy pierwszy napis na liście jest równy ostatniemu, drugi przedostatniemu, itd.):

```haskell
isListPalindrome :: [String] -> Bool
```

- Zastanów się, czy logika sprawdzania czy lista napisów jest palindromem, różni się od logiki sprawdzania czy jest nim napis? Jeżeli nie, to dobrą praktyką jest wspólna implementacja tych funkcji.
- Czy można jedną z tych funkcji zaimplementować za pomocą drugiej? Jeżeli nie, to co jest przeszkodą?

    **Wskazówka:** Napisz odpowiednią funkcję, ale możliwie ogólną (działającą dla listy elementów dowolnego typu z klasy `Eq`) i użyj jej w definicji zarówno `isPalindrome` jak i `isListPalindrome`.

**Przykłady użycia:**

```haskell
ghci> isListPalindrome ["abc","def","abc"]
True
ghci> isListPalindrome ["kajak","kok","ala"]
False
ghci> isListPalindrome ["aba","bb","aba"]
True
ghci> isListPalindrome ["a","b","b","a"]
True
ghci> isListPalindrome []
True
ghci> isListPalindrome ["abcd"]
True

```

### 4. Konkatenacja listy napisów

Napisz funkcję sprawdzającą, czy konkatenacja (połączenie) wszystkich napisów z listy tworzy palindrom:

```haskell
concatenationIsPalindrome :: [String] -> Bool
```

**Wskazówka:**
- Użyj funkcji `concat`.

**Przykłady użycia:**

```haskell
ghci> concatenationIsPalindrome ["ka","jak"]
True
ghci> concatenationIsPalindrome ["rad","ar"]
True
ghci> concatenationIsPalindrome ["hello","world"]
False
ghci> concatenationIsPalindrome ["a","bba"]
True
ghci> concatenationIsPalindrome ["a","bc","a"]
False
ghci> concatenationIsPalindrome ["",""]
True
ghci> concatenationIsPalindrome []
True
```

(higher-order-prelude)=
## Zadanie 2. Funkcje wyższego rzędu z modułu Prelude

Napisz własne wersje poniższych funkcji wyższego rzędu ze standardowego modułu `Prelude`.

Aby uniknąć konfliktów nazw z funkcjami wbudowanymi, ukryj je na początku pliku za pomocą instrukcji:

```haskell
import Prelude hiding (map, filter, takeWhile, dropWhile, zipWith)
```

Zaimplementuj następujące funkcje:

```haskell
map :: (a -> b) -> [a] -> [b]
filter :: (a -> Bool) -> [a] -> [a]
takeWhile :: (a -> Bool) -> [a] -> [a]
dropWhile :: (a -> Bool) -> [a] -> [a]
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
```

### Przykłady użycia

```haskell
ghci> map (^2) [1, 2, 3, 4]
[1, 4, 9, 16]

ghci> filter even [1, 2, 3, 4, 5, 6]
[2, 4, 6]

ghci> takeWhile (< 5) [1, 3, 4, 6, 2, 1]
[1, 3, 4]

ghci> dropWhile (< 5) [1, 3, 4, 6, 2, 1]
[6, 2, 1]

ghci> zipWith (+) [1, 2, 3] [10, 20, 30]
[11, 22, 33]
```

---

(join-map)=
## Zadanie 3. Łączenie elementów listy z transformacją

Napisz funkcję:

```haskell
joinMap :: (a -> String) -> String -> [a] -> String

```

która przekształca elementy listy wejściowej za pomocą zadanej funkcji `f`, a następnie skleja je w jeden napis, rozdzielając je podanym separatorem `sep`.

### Łączenie cyfr w napis

Wykorzystując funkcję `joinMap`, napisz funkcję:

```haskell
digitsToString :: [Int] -> String
```

która skleja listę liczb jednocyfrowych w napis &mdash; zapis liczby utworzonej z tych cyfr.

### Przykłady użycia

```haskell
ghci> joinMap show ", " [1, 2, 3]
"1, 2, 3"

ghci> digitsToString [1, 2, 3, 4, 5]
"12345"
```

---

(folds-prelude)=
## Zadanie 4. Funkcje zwijające z modułu Prelude

Napisz własne wersje standardowych funkcji służących do zwijania (redukcji) list z modułu `Prelude`.

Pamiętaj o ukryciu oryginalnych funkcji za pomocą:

```haskell
import Prelude hiding (foldl, foldl1, foldr, foldr1)
```

Zaimplementuj:

```haskell
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl1 :: (a -> a -> a) -> [a] -> a
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr1 :: (a -> a -> a) -> [a] -> a
```

---

(folds-practice)=

## Zadanie 5. Zastosowanie funkcji zwijających

Wykorzystując funkcje typu `fold` (np. standardowe `foldl`, `foldr` lub ich zaimplementowane odpowiedniki), napisz nowe wersje funkcji z poprzednich zadań. Funkcje te powinny być zaimplementowane w taki sposób, aby żadna z nich nie przeglądała listy więcej niż raz.

Zaimplementuj za pomocą zwijania:

1. Funkcję usuwającą zera z końca listy (zobacz zadanie: {ref}`Przycinanie zer i sekwencji końcowych <remove-zeros>`):
```haskell
removeTrailingZeros :: (Num a, Eq a) => [a] -> [a]
```

2. Funkcje obliczające odpowiednie średnie z listy liczb (zobacz zadanie: {ref}`Średnie z elementów listy <list-means>`):
```haskell
arithmeticMean :: Floating a => [a] -> a
geometricMean :: Floating a => [a] -> a
harmonicMean :: Floating a => [a] -> a
```