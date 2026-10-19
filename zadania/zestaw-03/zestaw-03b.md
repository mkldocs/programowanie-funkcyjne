# Listy, c.d.

**ematy:** listy

---

(digits-to-number)=

## Zadanie 1. Konwersja listy cyfr na liczbę

Napisz funkcję:

```haskell
digitsToNumber :: [Int] -> Int

```

przekształcającą listę cyfr dziesiętnych na odpowiadającą jej wartość liczbową.

### Przykłady użycia

```haskell
ghci> digitsToNumber [1, 2, 3, 4]
1234

ghci> digitsToNumber [0, 5, 0]
50

```

---

(polygon-area)=
## Zadanie 2. Pole powierzchni wielokąta

Wierzchołki wielokąta na płaszczyźnie dwuwymiarowej możemy reprezentować jako listę krotek współrzędnych `[(Double, Double)]`.

Napisz funkcję:

```haskell
polygonArea :: [(Double, Double)] -> Double

```

obliczającą pole powierzchni wielokąta na podstawie [wzoru Gaussa](https://pl.wikipedia.org/wiki/Metoda_analityczna_obliczania_p%C3%B3l) (ang. [*Shoelace formula*](https://en.wikipedia.org/wiki/Shoelace_formula)):

$$P = \frac{1}{2} \left\vert{} \sum_{i=0}^{n-1} (x_i y_{i+1} - x_{i+1} y_i) \right\vert{}$$

przy czym przyjmujemy, że dla ostatniego wierzchołka $(x_n, y_n) = (x_0, y_0)$.

### Przykład użycia

Dla kwadratu o wierzchołkach $(0,0)$, $(4,0)$, $(4,4)$, $(0,4)$:

```haskell
ghci> polygonArea [(0.0, 0.0), (4.0, 0.0), (4.0, 4.0), (0.0, 4.0)]
16.0

```

---

(diff-max-min)=

## Zadanie 3. Różnica między wartością maksymalną a minimalną

Napisz funkcję:

```haskell
diffMaxMin :: (Ord a, Num a) => [a] -> a

```

obliczającą różnicę między największym a najmniejszym elementem podanej listy.

Zaimplementuj funkcję w taki sposób, aby przeglądała listę **dokładnie raz** (bez osobnego wyznaczania maksimum, a następnie minimum).

### Przykłady użycia

```haskell
ghci> diffMaxMin [3.5, 1.45, 7.8, 2.1, 9.4]
7.95

ghci> diffMaxMin [5, 5, 5]
0.0

ghci> diffMaxMin [10.0]
0.0

ghci> diffMaxMin [3, 10, -4, 7]
14

```

### Uwagi

* Dla listy jednoelementowej różnica wynosi `0`.
* Zachowanie funkcji dla pustej listy nie ma znaczenia (funkcja może zgłosić błąd, podobnie jak funkcja `maximum` z modułu `Prelude`).

---

(continued-fraction)=

## Zadanie 4. Ułamek łańcuchowy

[Ułamek łańcuchowy](https://pl.wikipedia.org/wiki/U%C5%82amek_%C5%82a%C5%84cuchowy) to ułamek w postaci:

$$a_0 + \cfrac{1}{a_1 + \cfrac{1}{a_2 + \cfrac{1}{\ddots + \cfrac{1}{a_n}}}}$$

Napisz funkcję:

```haskell
continuedFraction :: Fractional a => [a] -> a

```

obliczającą wartość ułamka łańcuchowego reprezentowanego przez listę współczynników $[a_0, a_1, a_2, \dots, a_n]$.

### Przykład użycia

Dla listy `[1, 2, 3]` funkcja oblicza $1 + \frac{1}{2 + \frac{1}{3}} = 1 + \frac{3}{7} = \frac{10}{7}$:

```haskell
ghci> continuedFraction [1, 2, 3]
1.4285714285714286

```

---

(cellular-automaton)=

## Zadanie 5. Jednowymiarowy automat komórkowy

Rozważamy jednowymiarowy automat komórkowy składający się z ciągu komórek o dwóch możliwych stanach: czarnym (`1`) oraz białym (`0`).

Reguła przejścia dla każdej komórki w kolejnym kroku czasowym jest następująca:

* Komórka staje się biała (`0`), jeżeli wszyscy jej sąsiedzi (oraz ona sama) mają ten sam kolor.
* W przeciwnym razie komórka staje się czarna (`1`).

Dla komórek brzegowych (pierwszej i ostatniej) uwzględniamy tylko jednego istniejącego sąsiada oraz samą komórkę.

Napisz funkcję:

```haskell
automaton :: Int -> [Int] -> [Int]
```

gdzie pierwszy parametr `n` oznacza liczbę kroków do wykonania, a drugi parametr to początkowy stan automatu. Funkcja zwraca stan automatu po wykonaniu `n` kroków.

### Przebieg ewolucji (przykład)

| Krok | Stan automatu |
| --- | --- |
| 0 | `0 1 1 1 0 0 0 0 0 0 0 0` |
| 1 | `1 1 0 1 1 0 0 0 0 0 0 0` |
| 2 | `0 1 1 1 1 1 0 0 0 0 0 0` |
| 3 | `1 1 0 0 0 1 1 0 0 0 0 0` |
| 4 | `0 1 1 0 1 1 1 1 0 0 0 0` |
| 5 | `1 1 1 1 1 0 0 1 1 0 0 0` |
| 6 | `0 0 0 0 1 1 1 1 1 1 0 0` |
| 7 | `0 0 0 1 1 0 0 0 0 1 1 0` |
| 8 | `0 0 1 1 1 1 0 0 1 1 1 1` |
| 9 | `0 1 1 0 0 1 1 1 1 0 0 0` |
| 10 | `1 1 1 1 1 1 0 0 1 1 0 0` |

### Przykład użycia

```haskell
ghci> automaton 10 [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0]
[1,1,1,1,1,1,0,0,1,1,0,0]

```

---

(pesel-validation)=
## Zadanie 6. Numer PESEL

Numer PESEL to 11-cyfrowy identyfikator zawierający zakodowane informacje o dacie urodzenia, płci oraz cyfrę kontrolną.

Materiały pomocnicze:
* [Struktura numeru PESEL](pesel)

---

### Odczytywanie informacji z numeru PESEL

Napisz funkcje wyciągające poszczególne informacje z podanego numeru PESEL:

```haskell
gender :: String -> Char
year :: String -> Int
month :: String -> Int
day :: String -> Int
checkDigit :: String -> Int
computedCheckDigit :: String -> Int

```

Opis funkcji:

* `gender` &mdash; zwraca płeć jako pojedynczy znak (`'f'` dla kobiet, `'m'` dla mężczyzn),
* `year` &mdash; zwraca rok urodzenia (z uwzględnieniem stulecia zakodowanego w cyfrach miesiąca),
* `month` &mdash; zwraca miesiąc urodzenia (w zakresie 1–12),
* `day` &mdash; zwraca dzień urodzenia,
* `checkDigit` &mdash; zwraca odczytaną cyfrę kontrolną (ostatnią cyfrę numeru PESEL) jako wartość typu `Int`,
* `computedCheckDigit` &mdash; zwraca cyfrę kontrolną obliczoną na podstawie pierwszych 10 cyfr numeru PESEL jako wartość typu `Int`.

#### Założenia

Powyższe funkcje mogą założyć, że PESEL przekazany jako argument jest napisem o długości 11, złożonym z samych cyfr, a zakodowana w nim data jest poprawna. Nie musisz weryfikować tych warunków ani obsługiwać niepoprawnych danych wejściowych.

W poprawnym numerze PESEL funkcje `checkDigit` i `computedCheckDigit` powinny zwracać tę samą wartość, ale obie muszą działać również dla numerów z błędną cyfrą kontrolną.

---

### Sprawdzanie poprawności numeru PESEL

Napisz funkcje weryfikujące poprawność numeru PESEL:

```haskell
isValidCheckDigit :: String -> Bool
isValidDate :: String -> Bool
isValidPesel :: String -> Bool

```

Opis funkcji:

* `isValidCheckDigit` &mdash; sprawdza, czy cyfra kontrolna zapisana na końcu numeru zgadza się z wartością wyliczoną na podstawie pierwszych 10 cyfr.
* `isValidDate` &mdash; sprawdza, czy zakodowana data jest poprawna: miesiąc musi należeć do zakresu 1–12, a dzień musi mieścić się w zakresie właściwym dla danego miesiąca (uwzględniając lata przestępne dla lutego).
* `isValidPesel` &mdash; sprawdza pełną poprawność numeru PESEL: poprawność składniową (napis o długości 11 złożony wyłącznie z cyfr) oraz poprawność daty i cyfry kontrolnej.

---

### Operacje na listach numerów PESEL

Napisz funkcje operujące na listach numerów PESEL (`[String]`):

```haskell
allValidPesels :: [String] -> Bool
countGenders :: [String] -> (Int, Int)
youngest :: [String] -> (Int, Int, Int)
oldest :: [String] -> (Int, Int, Int)

```

Opis funkcji:

* `allValidPesels` &mdash; sprawdza, czy wszystkie numery PESEL znajdujące się na liście są poprawne.
* `countGenders` &mdash; zwraca krotkę, w której pierwszy element to liczba kobiet, a drugi &mdash; liczba mężczyzn.
* `youngest` &mdash; zwraca najpóźniejszą datę urodzenia spośród wszystkich podanych numerów PESEL w postaci krotki `(rok, miesiąc, dzień)`.
* `oldest` &mdash; zwraca najwcześniejszą datę urodzenia spośród wszystkich podanych numerów PESEL w postaci krotki `(rok, miesiąc, dzień)`.

---

(polynomial-arithmetic)=

## Zadanie 7. Arytmetyka wielomianów

Wielomian jednej zmiennej można reprezentować jako listę współczynników w kolejności od wyrazu wolnego do współczynnika przy najwyższej potędze. Wielomian zerowy reprezentowany jest przez pustą listę `[]`.

**Przykład:**

Wielomian $5x^4 - 3x + 2$ reprezentowany jest przez listę `[2, -3, 0, 0, 5]`.

### Dodawanie i mnożenie wielomianów

Napisz funkcje realizujące dodawanie i mnożenie wielomianów w podanej reprezentacji:

```haskell
addPoly :: (Eq a, Num a) => [a] -> [a] -> [a]
mulPoly :: (Eq a, Num a) => [a] -> [a] -> [a]

```

**Wskazówka do mnożenia:**
Możesz wykorzystać następujący fakt:

$$
\begin{align*}
& (a_0 + a_1x + \ldots + a_nx^n) \times (b_0 + b_1x + \ldots + b_mx^m) = \\
& \qquad a_0 \times (b_0 + b_1x + \ldots + b_mx^m) \\
& \qquad + \left( (a_1 + \ldots + a_nx^{n-1}) \times (b_0 + b_1x + \ldots + b_mx^m) \right) \times x
\end{align*}
$$

**Uwagi:**

* Zwracana lista nie może zawierać nadmiarowych zer na końcu, nawet jeżeli występowały one w argumentach wywołania.

**Przykłady użycia**

- 
    ```haskell
    ghci> addPoly [1, 2] [-5, 5, 6]
    [-4,7,6]
    ```
    $(1 + 2x) + (-5 + 5x + 6x^2) = -4 + 7x + 6x^2$:

- 
    ```haskell
    ghci> addPoly [1, -2, 0, 3] [-1, 2, 0, -3, 0]
    []
    ```
    $(1 - 2x + 3x^3) + (-1 + 2x - 3x^3) = 0$

-
    ```haskell
    ghci> addPoly [0, 0, 1] [0, 0, -1]
    []
    ```
    $x^2 + (-x^2) = 0$

-
    ```haskell
    ghci> mulPoly [1, 2, 1] [2, -3]
    [2,1,-4,-3]
    ```
    $(1 + 2x + x^2)(2 - 3x) = 2 + x - 4x^2 - 3x^3$

-
    ```haskell
    ghci> mulPoly [1, 1] [-1, 1]
    [-1,0,1]
    ```
    $(1 + x)(-1 + x) = -1 + x^2$

---

### Konwersja na napis

Napisz funkcję przekształcającą wielomian w jego reprezentację tekstową:

```haskell
polyToString :: (Eq a, Num a, Show a) => [a] -> String

```

Zadbaj o to, aby wynikowy napis był możliwie zwięzły. Zastosuj następujące reguły:

* pomijaj wykładnik jeżeli jest równy 1: `"x"` zamiast `"x^1"`,
* pomijaj symbol zmiennej dla wyrazu wolnego: `"5"` zamiast `"5x^0"`,
* pomijaj współczynnik równy 1 z wyjątkiem wyrazu wolnego: `"x^3"` zamiast `"1x^3"`,
* pomijaj całkowicie jednomiany ze współczynnikiem 0 z wyjątkiem wielomianu zerowego, który powinien zostać wyświetlony jako `"0"`, a nie jako pusty napis,
* jednomiany mają być w kolejności od najwyższej potęgi do wyrazu wolnego.

**Przykład użycia:**

Dla wielomianu $3x^5 + x^2 + 5x + 7$ reprezentowanego listą `[7, 5, 1, 0, 0, 3]`:

```haskell
ghci> polyToString [7, 5, 1, 0, 0, 3]
"3x^5 + x^2 + 5x + 7"
```

(dictionary-as-list)=
## Zadanie 8. Słownik jako lista krotek

Słownik (tablicę asocjacyjną) można w prosty sposób reprezentować jako listę dwuelementowych krotek postaci `(klucz, wartość)`.

Napisz zestaw funkcji realizujących podstawowe operacje na takiej strukturze danych:

1. `emptyDict :: [(k, v)]` &mdash; zwraca pusty słownik.
2. `hasKey :: Eq k => k -> [(k, v)] -> Bool` &mdash; sprawdza, czy zadany klucz znajduje się w słowniku.
3. `getValue :: Eq k => k -> [(k, v)] -> v` &mdash; zwraca wartość powiązaną z zadanym kluczem. Jeżeli klucza nie ma w słowniku, funkcja może zgłosić błąd (np. za pomocą funkcji `error`).
4. `insertKV :: Eq k => k -> v -> [(k, v)] -> [(k, v)]` &mdash; dodaje nowy wpis do słownika. Jeżeli zadany klucz już w nim istnieje, jego wartość powinna zostać zastąpiona nową.
5. `removeKey :: Eq k => k -> [(k, v)] -> [(k, v)]` &mdash; usuwa ze słownika wpis z zadanym kluczem (jeżeli klucz nie istnieje, zwraca słownik bez zmian).
6. `keys :: [(k, v)] -> [k]` &mdash; zwraca listę wszystkich kluczy występujących w słowniku.
7. `values :: [(k, v)] -> [v]` &mdash; zwraca listę wszystkich wartości występujących w słowniku.

Funkcje mają zachowywać kolejność wstawiania klucza, tzn. elementy z nowym kluczem wstawiane są na koniec listy.

### Przykłady użycia

```haskell
ghci> emptyDict
[]

ghci> hasKey "def" [("abc",3),("def",6),("ghi",7)]
True

ghci> hasKey "xyz" [("abc",3),("def",6),("ghi",7)]
False

ghci> getValue "def" [("abc",3),("def",6),("ghi",7)]
6

ghci> insertKV "xyz" 10 [("abc",3),("def",6)]
[("abc",3),("def",6),("xyz",10)]

ghci> insertKV "abc" 99 [("abc",3),("def",6)]
[("abc",99),("def",6)]

ghci> removeKey "def" [("abc",3),("def",6),("ghi",7)]
[("abc",3),("ghi",7)]

ghci> keys [("abc", 3),("def", 6),("ghi",7)]
["abc","def","ghi"]

ghci> values [("abc",3),("def",6),("ghi", 7)]
[3,6,7]
```