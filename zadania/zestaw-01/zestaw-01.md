# Zadania wprowadzające do programowania funkcyjnego w Haskellu

Tematy: definiowanie funkcji, podstawowy system typów Haskella, wyrażenia arytmetyczne, selekcja, prostego dopasowanie wzorców, operacje na podstawowych typach

---

(zadanie-01)=
## Zadanie 1. Wyrażenia arytmetyczne

Napisz funkcje `expr1`, `expr2`, ..., `expr8`, obliczające wartości poniższych wyrażeń. W zależności od wyrażenia funkcja może mieć jeden, dwa, trzy lub cztery parametry.

Nie podawaj sygnatur funkcji. Po ich zdefiniowaniu sprawdź za pomocą polecenia `:t` (`:type`), jakie sygnatury zostały wywnioskowane przez Haskella.

1. $a^2 + b^2$
2. $(a+b)^2$
3. $ab + cd$
4. $\frac{a-b}{c+d}$
5. $\frac{a}{b}d$
6. $\left\lfloor\frac{a}{4}\right\rfloor$
7. $\left(\frac{a}{b}\right)^3$
8. $\sqrt{|a-b|}$

Kreska ułamkowa oznacza zwykłe dzielenie, a symbol $\lfloor x\rfloor$ oznacza podłogę liczby $x$.

### Różne sposoby obliczania części całkowitej

Funkcję z punktu 6 napisz na dwa sposoby: jedną wersję z użyciem operatora `/` i funkcji `floor`, a drugą z użyciem funkcji `div`.

Sprawdź sygnatury obu funkcji i spróbuj użyć ich dla wartości różnych typów, np.:

```haskell
ghci> expr6a (10 :: Double)
ghci> expr6a (10 :: Int)
ghci> expr6b (10 :: Double)
ghci> expr6b (10 :: Int)
```

Zwróć uwagę na różnicę między tymi funkcjami oraz na sposób, w jaki system typów ogranicza ich zastosowanie.

---

(zadanie-02)=
## Zadanie 2. Operacje na liczbach całkowitych

Napisz funkcje operujące na nieujemnych liczbach całkowitych:

```haskell
onesDigit :: Integer -> Int

tensDigit :: Integer -> Integer
```

`onesDigit` powinna zwracać cyfrę jedności, a `tensDigit` — cyfrę dziesiątek.

### Przykłady użycia

```haskell
ghci> onesDigit 123
3

ghci> tensDigit 123
2

ghci> onesDigit 7
7

ghci> tensDigit 7
0
```

---

(zadanie-03)=
## Zadanie 3. Konwersje między typami liczbowymi

Napisz następujące funkcje.

### Średnia arytmetyczna

```haskell
avg :: Int -> Int -> Double
```

Funkcja powinna obliczać średnią arytmetyczną dwóch liczb całkowitych.

### Iloraz

```haskell
quotient :: (Real a, Real b) => a -> b -> Double
```

Funkcja powinna zwracać wartość zmiennoprzecinkową, ale przyjmować argumenty dowolnych typów należących do klasy `Real`.

### Pierwiastek cyfry

```haskell
sqrtDigit :: Char -> Double
```

Funkcja przyjmuje jednocyfrową liczbę zapisaną jako `Char`, np. `'1'`, `'4'` lub `'9'`, i zwraca jej pierwiastek kwadratowy.

### Przykłady użycia

```haskell
ghci> avg 5 7
6.0

ghci> avg 10 20
15.0

ghci> quotient (4 :: Int) (2 :: Integer)
2.0

ghci> quotient 5.5 (2 :: Int)
2.75

ghci> sqrtDigit '9'
3.0

ghci> sqrtDigit '4'
2.0
```

### Wskazówki

- W funkcji `avg` użyj `fromIntegral`.
- W funkcji `quotient` możesz użyć `realToFrac`.
- W funkcji `sqrtDigit` możesz użyć `fromEnum` i `fromIntegral`.

Spróbuj również samodzielnie prześledzić, dlaczego wyrażenie

```haskell
sqrt (fromEnum '9' - fromEnum '0')
```
nie ma odpowiedniego typu, a wyrażenie

```haskell
sqrt (fromIntegral (fromEnum '9' - fromEnum '0'))
```
ma typ pozwalający na obliczenie wyniku typu `Double`.

---

(zadanie-04)=
## Zadanie 4. Operacje na dniach tygodnia

Zdefiniuj funkcje operujące na dniach tygodnia reprezentowanych za pomocą liczb.

W pierwszej wersji dni tygodnia są numerowane od `0` do `6`:

```haskell
nextDay0 :: Int -> Int
previousDay0 :: Int -> Int
```

W drugiej wersji są numerowane od `1` do `7`:

```haskell
nextDay1 :: Int -> Int
previousDay1 :: Int -> Int
```

Funkcje `nextDay0` i `nextDay1` powinny zwracać numer następnego dnia, a `previousDay0` i `previousDay1` — numer dnia poprzedniego. Po sobocie następuje poniedziałek, a przed poniedziałkiem jest niedziela.

### Przykłady użycia

```haskell
ghci> nextDay0 3
4

ghci> nextDay0 6
0

ghci> previousDay0 0
6

ghci> previousDay0 4
3

ghci> nextDay1 3
4

ghci> nextDay1 7
1

ghci> previousDay1 1
7

ghci> previousDay1 4
3
```

---

---

(zadanie-05)=
## Zadanie 5. Konwersje czasu

Napisz funkcję konwertującą czas podany w godzinach, minutach i sekundach na całkowitą liczbę sekund:

```haskell
timeToSeconds :: Int -> Int -> Int -> Int
```

Napisz również funkcję obliczającą pełną liczbę dni zawartych w podanej liczbie sekund:

```haskell
secondsToDays :: Int -> Int
```

### Przykłady użycia

```haskell
ghci> timeToSeconds 5 40 12
20412

ghci> timeToSeconds 1 0 0
3600

ghci> secondsToDays 1000000
11

ghci> secondsToDays 86400
1

ghci> secondsToDays 90000
1
```

---

(zadanie-06)=
## Zadanie 6. Konwersje współrzędnych geograficznych

Współrzędne geograficzne mogą być wyrażone w stopniach, minutach i sekundach, np. $50^\circ15'13''$, albo w stopniach dziesiętnych, np. $22{,}7386^\circ$.

### Stopnie, minuty i sekundy → stopnie dziesiętne

Napisz funkcję:

```haskell
dmsToDecimal :: Int -> Int -> Int -> Double
```

obliczającą wartość w stopniach dziesiętnych.

### Stopnie dziesiętne → stopnie, minuty i sekundy

Napisz funkcję:

```haskell
decimalToDms :: Double -> (Int, Int, Int)
```

konwertującą współrzędną ze stopni dziesiętnych na stopnie, minuty i sekundy z dokładnością do sekundy.

### Przykłady użycia

```haskell
ghci> dmsToDecimal 50 15 13
50.25361111111111

ghci> dmsToDecimal 22 44 19
22.73861111111111

ghci> decimalToDms 22.7386
(22,44,18)

ghci> decimalToDms 50.2536
(50,15,12)
```

### Wskazówka

Pamiętaj, że:

- 1 stopień = 60 minut,
- 1 minuta = 60 sekund,
- stopnie dziesiętne = stopnie + minuty/60 + sekundy/3600.

---

(zadanie-07)=
## Zadanie 7. Temperatury

Temperatura może być podana między innymi w stopniach Celsjusza lub Fahrenheita. Przelicznik jest następujący:

$$F=C\times\frac{9}{5}+32$$

$$C=(F-32)\times\frac{5}{9}$$

Napisz funkcje:

```haskell
fahrenheitToCelsius :: Double -> Double
celsiusToFahrenheit :: Double -> Double
```

Następnie zdefiniuj funkcję:

```haskell
isCelsius :: Double -> Bool
```

Zakładamy, że pomiar temperatury ciała wyrażony w stopniach Celsjusza należy do przedziału $[20,45]$, a wyrażony w stopniach Fahrenheita do przedziału $[68,113]$. Dla wartości spoza tych przedziałów zachowanie funkcji nie ma znaczenia.

Na koniec napisz funkcję:

```haskell
celsius :: Double -> Double
```

która otrzymuje wartość temperatury ciała bez informacji o skali i zwraca odpowiadającą jej temperaturę w stopniach Celsjusza.

### Przykłady użycia

```haskell
ghci> celsius 36.6
36.6

ghci> celsius 99.5
37.5
```

---

(zadanie-08)=
## Zadanie 8. Prosta matematyka 

1. Napisz funkcję:

```haskell
sign :: (Ord a, Num a) => a -> a
```

zwracającą `-1`, `0` lub `1` w zależności od znaku argumentu.

2. Napisz funkcję:

```haskell
deltaSign :: (Ord a, Num a) => a -> a -> a -> a
```

zwracającą znak wyróżnika równania kwadratowego $ax^2+bx+c=0$.

Możesz potraktować obliczenie wyróżnika jako wartość pomocniczą i wykorzystać ją w dalszej części definicji.

3. Napisz funkcję sprawdzającą, czy trzy podane długości boków tworzą trójkąt prostokątny. Ze względu na możliwe błędy zaokrągleń przy obliczeniach zmiennoprzecinkowych przyjmij małą tolerancję przy sprawdzaniu różnicy wartości zmiennoprzecinkowych, np. $\varepsilon=10^{-7}$. Zwróć uwagę, że dla sprawdzenia równości wartości zmiennoprzecinkowych z tolerancją należy badać wartość bezwzględną różnicy.

W tym zadaniu spróbuj użyć mechanizmu strażników.

---

(zadanie-09)=
## Zadanie 9. Krotki

### 1. Elementy krotki

Dla krotki trójelementowej zdefiniuj funkcje `first`, `second`, `third`, `sum3`.

    Pierwsze trzy funkcje powinny zwracać odpowiednio pierwszy, drugi i trzeci element krotki, a `sum3` — sumę jej elementów.

### 2. Pierwszy element różny od zera

Napisz funkcję `firstNonZero`, która dla krotki trójelementowej zwraca pierwszy element różny od zera. Jeżeli wszystkie trzy elementy są równe zeru, funkcja może zgłosić błąd za pomocą `error`.

Następnie napisz:

```haskell
firstNonZeroSquared
```

która zwraca kwadrat wyniku `firstNonZero`.

#### Wersja z `case`

Zdefiniuj drugą wersję `firstNonZeroSquared`, w której dopasowanie do wzorców wykonasz bez użycia funkcji pomocniczej `firstNonZero`, wykorzystując wyrażenie `case`.

### 3. Zamiana elementów

Zdefiniuj funkcję `swap`, która zamienia miejscami elementy krotki dwuelementowej.

Zastanów się, jaka jest najbardziej ogólna sygnatura tej funkcji. Następnie sprawdź, jakie ograniczenia wynikają z zastosowania sygnatury:

```haskell
swap :: (a, a) -> (a, a)
```

### 4. Przesunięcie elementów

Zdefiniuj funkcję `shift3`, która przesuwa elementy krotki trójelementowej o jedno miejsce w prawo — trzeci element trafia na pierwsze miejsce. Jaka jest najbardziej ogólna sygnatura takiej funkcji?

```haskell
shift3 (1, 2, 3) = (3, 1, 2)
```

### 5. Sumowanie elementów parami

Zdefiniuj funkcję `sumTuples3`, która dodaje odpowiadające sobie elementy dwóch krotek trójelementowych. Zastanów się, jaka jest jej najbardziej ogólna sygnatura.

```haskell
ghci> sumTuples3 (3, 5, 7) (10, 20, 100)
(13,25,107)
```

Następnie rozważ funkcję:

```haskell
sumWithPrev3 tup = sumTuples3 tup (shift3 tup)
```

Sprawdź wynik dla:

```haskell
ghci> sumWithPrev3 (1, 10, 100)
(101,11,110)
```

i spróbuj podać jej najbardziej ogólną sygnaturę.

---

(zadanie-10)=
## Zadanie 10. Znaki

### 1. Samogłoski

Napisz funkcję:

```haskell
isPolishVowel :: Char -> Bool
```

która dla małej litery zwraca `True`, jeżeli znak jest samogłoską alfabetu polskiego:

`a`, `ą`, `e`, `ę`, `i`, `o`, `ó`, `u`, `y`.

Dla pozostałych znaków zwracaj `False`.

### 2. Inicjały

Napisz funkcję:

```haskell
initials :: (String, String) -> String
```

która dla krotki zawierającej imię i nazwisko zwraca ich inicjały w postaci np. `"M.K."`.

Załóż, że oba napisy wejściowe są niepuste.

---

(zadanie-11)=
## Zadanie 11. Punkty w przestrzeni

Punkt 2D reprezentuj jako krotkę `(Double, Double)`. Zdefiniuj funkcje:

```haskell
origin2D :: (Double, Double)
distanceFromOrigin2D :: (Double, Double) -> Double
distance2D :: (Double, Double) -> (Double, Double) -> Double
midpoint2D :: ((Double, Double), (Double, Double)) -> (Double, Double)
centroid2D :: (Double, Double) -> (Double, Double) -> (Double, Double) -> (Double, Double)
```

Odpowiednio mają one zwracać początek układu współrzędnych, odległość punktu od początku układu, odległość dwóch punktów, środek odcinka oraz środek ciężkości trzech punktów.

Następnie zdefiniuj analogiczne funkcje dla punktów 3D:

```haskell
origin3D :: (Double, Double, Double)
distanceFromOrigin3D :: (Double, Double, Double) -> Double
distance3D :: (Double, Double, Double) -> (Double, Double, Double) -> Double
midpoint3D :: ((Double, Double, Double), (Double, Double, Double)) -> (Double, Double, Double)
centroid3D :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
```

### Przykłady użycia

```haskell
ghci> origin2D
(0.0,0.0)

ghci> distanceFromOrigin2D (3.0, 4.0)
5.0

ghci> distance2D (0.0, 0.0) (3.0, 4.0)
5.0

ghci> midpoint2D ((0.0, 0.0), (4.0, 6.0))
(2.0,3.0)

ghci> centroid2D (0.0, 0.0) (4.0, 0.0) (0.0, 6.0)
(1.3333333333333333,2.0)

ghci> origin3D
(0.0,0.0,0.0)

ghci> distanceFromOrigin3D (1.0, 2.0, 2.0)
3.0

ghci> distance3D (0.0, 0.0, 0.0) (1.0, 2.0, 2.0)
3.0

ghci> midpoint3D ((0.0, 0.0, 0.0), (2.0, 4.0, 6.0))
(1.0,2.0,3.0)

ghci> centroid3D (0.0, 0.0, 0.0) (3.0, 0.0, 0.0) (0.0, 3.0, 0.0)
(1.0,1.0,0.0)
```

---

(zadanie-13)=
## Zadanie 13. Poprawność daty

Datę reprezentuj jako krotkę `(rok, miesiąc, dzień)`.

Zdefiniuj funkcje:

```haskell
leapYear :: Int -> Bool
daysInMonth :: (Int, Int) -> Int
validYear :: Int -> Bool
validMonth :: Int -> Bool
validDay :: Int -> (Int, Int) -> Bool
validDate :: (Int, Int, Int) -> Bool
```

`leapYear` ma sprawdzać, czy rok jest przestępny. Rok jest przestępny, jeżeli jest podzielny przez 4, z wyjątkiem lat podzielnych przez 100, chyba że są również podzielne przez 400.

`daysInMonth` ma zwracać liczbę dni w zadanym miesiącu. Miesiąc jest podany jako część krotki `(rok, miesiąc)`.

`validYear` ma sprawdzać, czy rok jest większy od zera, `validMonth` — czy miesiąc należy do zakresu 1–12, a `validDay` — czy dzień należy do zakresu 1–`n`, gdzie `n` jest liczbą dni w zadanym miesiącu.

W `validDate` możesz wykorzystać powyższe funkcje pomocnicze.

### Przykłady użycia

```haskell
ghci> validDate (2023, 2, 28)
True

ghci> validDate (2023, 2, 29)
False

ghci> validDate (2024, 2, 29)
True

ghci> validDate (2023, 4, 31)
False

ghci> validDate (0, 1, 1)
False

ghci> validDate (2000, 13, 1)
False

ghci> leapYear 2023
False

ghci> leapYear 2024
True

ghci> leapYear 1900
False

ghci> leapYear 2000
True
```

---

(zadanie-14)=
## Zadanie 14. Następny i poprzedni dzień

Wykorzystując definicje z poprzedniego zadania, napisz funkcje:

```haskell
nextDate :: (Int, Int, Int) -> (Int, Int, Int)
previousDate :: (Int, Int, Int) -> (Int, Int, Int)
```

`nextDate` powinna zwracać dzień następujący po podanej dacie, a `previousDate` — dzień poprzedni.

### Przykłady użycia

```haskell
ghci> nextDate (2023, 12, 31)
(2024,1,1)

ghci> nextDate (2023, 2, 28)
(2023,3,1)

ghci> nextDate (2024, 2, 28)
(2024,2,29)

ghci> previousDate (2024, 1, 1)
(2023,12,31)

ghci> previousDate (2023, 3, 1)
(2023,2,28)

ghci> previousDate (2024, 3, 1)
(2024,2,29)
```

Możesz założyć, że argument jest poprawną datą.

---

(zadanie-15)=
## Zadanie 15. Pora roku

Napisz funkcję:

```haskell
season :: (Int, Int, Int) -> String
```

która dla daty reprezentowanej jako krotka `(rok, miesiąc, dzień)` zwraca jedną z wartości: `"wiosna"`, `"lato"`, `"jesień"`, `"zima"`.

Pory roku zaczynają się w następujących dniach; podany dzień należy już do nowej pory roku:

- wiosna: 21 marca,
- lato: 22 czerwca,
- jesień: 23 września,
- zima: 22 grudnia.

Funkcja nie musi sprawdzać poprawności daty, np. dla `31 lutego`.

### Przykłady użycia

```haskell
ghci> season (2000, 3, 20)
"zima"

ghci> season (1900, 3, 21)
"wiosna"

ghci> season (2011, 6, 22)
"lato"

ghci> season (2026, 9, 22)
"lato"

ghci> season (1853, 9, 23)
"jesień"

ghci> season (2023, 12, 22)
"zima"

ghci> season (2024, 1, 15)
"zima"
```

---

(zadanie-16)=
## Zadanie 16. Nazwy świąt

Napisz funkcję:

```haskell
holidayName :: Int -> Int -> String
```

która dla podanego dnia i miesiąca zwraca nazwę święta przypadającego tego dnia albo pusty napis `""`, jeżeli tego dnia nie ma święta.

Na tym etapie uwzględnij wyłącznie święta stałe:

- 1 stycznia — `"Nowy Rok"`,
- 6 stycznia — `"Trzech Króli"`,
- 1 maja — `"Święto Pracy"`,
- 3 maja — `"Święto Narodowe Trzeciego Maja"`,
- 15 sierpnia — `"Wniebowzięcie Najświętszej Maryi Panny"`,
- 1 listopada — `"Wszystkich Świętych"`,
- 11 listopada — `"Narodowe Święto Niepodległości"`,
- 24 grudnia — `"Wigilia Bożego Narodzenia"`,
- 25 grudnia — `"pierwszy dzień Bożego Narodzenia"`,
- 26 grudnia — `"drugi dzień Bożego Narodzenia"`.

Nie uwzględniaj świąt ruchomych.

---

(zadanie-17)=
## Zadanie 17. Wielkanoc

Napisz funkcję:

```haskell
easter :: Int -> (Int, Int)
```

która dla roku z zakresu 1900–2099 zwraca miesiąc i dzień Wielkanocy. Pozostałe lata nie muszą być obsługiwane.

Możesz bezpośrednio wykorzystać następujące wzory:

- $$LunarAge = (24 + 19 \times (Year \bmod 19)) \bmod 30$$
- $$AdjustedLunarAge = LunarAge - \left\lfloor\frac{LunarAge}{28}\right\rfloor$$
- $$FullMoonWeekday = (Year + \left\lfloor\frac{Year}{4}\right\rfloor + AdjustedLunarAge - 13) \bmod 7$$
- $$DaysToEaster = AdjustedLunarAge - FullMoonWeekday$$
- $$EasterMonth = 3 + \left\lfloor\frac{DaysToEaster + 40}{44}\right\rfloor$$
- $$EasterDay = DaysToEaster + 28 - 31 \times \left\lfloor\frac{EasterMonth}{4}\right\rfloor$$

### Przykłady użycia

```haskell
ghci> easter 2002
(3,31)

ghci> easter 2026
(4,5)
```
---

(zadanie-18)=
## Zadanie 18. Odmiana nazw

Napisz funkcję, która dla zadanej liczby zwraca odpowiednią formę słowa `"złoty"`: `"złoty"`, `"złote"` albo `"złotych"`.

Przykładowo:

- `1` → `"złoty"`,
- `2` → `"złote"`,
- `4` → `"złote"`,
- `5` → `"złotych"`,
- `12` → `"złotych"`,
- `22` → `"złote"`.

Następnie napisz ogólniejszą funkcję, która oprócz liczby przyjmuje krotkę trzech form rzeczownika. Są to kolejno:

1. mianownik liczby pojedynczej, np. `"dom"`,
2. mianownik liczby mnogiej, np. `"domy"`,
3. dopełniacz liczby mnogiej, np. `"domów"`.

Na tej podstawie funkcja powinna zwracać właściwą formę rzeczownika dla podanej liczby.

Na koniec napisz funkcję, która dla ceny reprezentowanej jako krotka `(złote, grosze)` zwraca jej słowny zapis. Zerowe części ceny pomijaj w zapisie, z wyjątkiem ceny `0 zł` i `0 gr`, dla której wynik powinien być `"0 złotych"`.

Przykładowo:

```text
(3, 50)  → "3 złote i 50 groszy"
(12, 1)  → "12 złotych i 1 grosz"
(3, 0)   → "3 złote"
(0, 50)  → "50 groszy"
(0, 0)   → "0 złotych"
```

---

(zadanie-19)=
## Zadanie 19. Godzina zapisana słownie

Zaimplementuj funkcję:

```haskell
hourToText :: Int -> Int -> String
```

która przekształca podaną godzinę i minutę w 12-godzinnym formacie na polski opis odpowiadający na pytanie „Która godzina?”.

Przyjmij:

- `h` jest w zakresie `0–11`, przy czym `0` oznacza godzinę 12,
- `m` jest w zakresie `0–59`.

Uwzględnij następujące przypadki:

- `m = 0` — sama godzina w mianowniku, np. `"dwunasta"`,
- `m = 1` — `"minuta po ..."`,
- `m = 15` — `"kwadrans po ..."`,
- `m = 30` — `"wpół do ..."`,
- `m = 45` — `"za kwadrans ..."`,
- `m = 59` — `"za minutę ..."`,
- `1 < m < 30` — liczba minut w mianowniku + `" po "` + godzina w dopełniaczu,
- `31 <= m <= 58` — `"za "` + liczba `60-m` + następna godzina w mianowniku.

Dla `h = 11` następną godziną jest 12, a dla `h = 0` następną godziną jest 1.

Możesz zdefiniować funkcje pomocnicze zamieniające numery godzin i minut na odpowiednie formy liczebników.

### Przykłady użycia

```haskell
ghci> hourToText 0 0
"dwunasta"

ghci> hourToText 0 1
"minuta po dwunastej"

ghci> hourToText 7 59
"za minutę ósma"

ghci> hourToText 0 15
"kwadrans po dwunastej"

ghci> hourToText 0 45
"za kwadrans pierwsza"

ghci> hourToText 0 30
"wpół do pierwszej"

ghci> hourToText 0 20
"dwadzieścia po dwunastej"

ghci> hourToText 4 21
"dwadzieścia jeden po czwartej"

ghci> hourToText 4 22
"dwadzieścia dwie po czwartej"

ghci> hourToText 0 40
"za dwadzieścia pierwsza"

ghci> hourToText 4 39
"za dwadzieścia jeden piąta"
```
