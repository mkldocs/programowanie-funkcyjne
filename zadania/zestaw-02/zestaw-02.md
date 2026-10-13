# Rekurencja i rekurencja ogonowa

Tematy: rekurencja, rekurencja ogonowa

---

(harmonic-number)=
## Zadanie 1. Liczba harmoniczna

Napisz funkcję `harmonic` o sygnaturze
```haskell
harmonic :: Int -> Double
```
która dla zadanej wartości $n$ zwróci $n$-tą liczbę harmoniczną, czyli wartość wyrażenia:

$$\sum_{k=1}^{n}\frac{1}{k} = 1 + \frac{1}{2} + \ldots + \frac{1}{n - 1} + \frac{1}{n}$$


---

(capital-growth)=
## Zadanie 2. Wzrost kapitału

Napisz funkcję w Haskellu symulującą wzrost kapitału z regularnymi wpłatami i odsetkami składanymi. Funkcja powinna uwzględniać opcjonalny podatek od zysków kapitałowych (tzw. podatek Belki).

```haskell
calculateCapital :: Double -> Double -> Double -> Int -> Bool -> Double
```

Parametry:

* `initialCapital` — początkowy kapitał
* `contribution` — stała wpłata dodawana na początku każdego okresu
* `rate` — stopa procentowa za jeden okres (np. `0.05` dla 5%)
* `periods` — liczba okresów kapitalizacji
* `withBelkaTax` — czy naliczać 19% podatek od zysków

Funkcja zwraca kapitał końcowy po zadanej liczbie okresów.

Dla każdego okresu:

1. Do kapitału z poprzedniego okresu dodaj stałą wpłatę.
2. Oblicz odsetki od aktualnego kapitału.
3. Jeżeli należy zastosować podatek, pomnóż odsetki przez 0,81 (19% podatku).
4. Dodaj odsetki do kapitału.

### Przykłady użycia

- Bez podatku, 3 okresy, kapitał początkowy: 1000, wpłata: 500, stopa: 10%:
    ```haskell
    ghci> calculateCapital 1000 500 0.1 3 False
    3151.5
    ```
- Z podatkiem Belki:
    ```haskell
    ghci> calculateCapital 1000 500 0.1 3 True
    3019.6
    ```

---

(lcg-generator)=
## Zadanie 3. Linear Congruential Generator

Linear Congruential Generator (LCG) to prosty algorytm generowania ciągów liczb pseudolosowych. Wygenerowany ciąg jest zdefiniowany w następujący sposób:

* $X_0 = s$
* $X_n = (a X_{n-1} + c) \bmod m$

Napisz funkcję, która zwraca $n$-ty element wygenerowanego ciągu.

```haskell
lcg :: Integer -> Integer -> Integer -> Integer -> Int -> Integer
```

Parametry:

* `multiplier` — mnożnik ($a$)
* `increment` — przyrost ($c$)
* `modulus` — moduł ($m$)
* `seed` — ziarno ($s$)
* `n` — numer elementu ciągu

Dla $n = 0$ funkcja zwraca wartość ziarna.

### Przykłady użycia

* Prosty generator: $a = 3, c = 5, m = 16, s = 7$:

    ```haskell
    ghci> lcg 3 5 16 7 0
    7

    ghci> lcg 3 5 16 7 1  -- (3×7 + 5) mod 16 = 26 mod 16 = 10
    10

    ghci> lcg 3 5 16 7 2  -- (3×10 + 5) mod 16 = 35 mod 16 = 3
    3

    ghci> lcg 3 5 16 7 3  -- (3×3 + 5) mod 16 = 14 mod 16 = 14
    14
    ```

* Generator MINSTD (Park-Miller):
    ```haskell
    minstd :: Integer -> Int -> Integer
    minstd seed n = lcg 16807 0 (2^31 - 1) seed n
    ```

---

(wallis-formula)=
## Zadanie 4. Wzór Wallisa

Mamy następujący wzór (wzór Wallisa):

$$\prod _{k=1}^{\infty }{\frac {(2k)(2k)}{(2k-1)(2k+1)}}=\bigl({\frac {2}{1}}\cdot {\frac {2}{3}}\bigr)\cdot \bigl({\frac {4}{3}}\cdot {\frac {4}{5}}\bigr)\cdot \bigl({\frac {6}{5}}\cdot {\frac {6}{7}}\bigr)\cdot \bigl({\frac {8}{7}}\cdot {\frac {8}{9}}\bigr)\cdot \ldots ={\frac {\pi }{2}}$$

Napisz funkcję o sygnaturze
```haskell
wallis :: Int -> Double
```
która zwraca przybliżenie liczby $\pi$ używając pierwszych $n$ czynników ze wzoru.


---

(newton-symbol)=
## Zadanie 5. Symbol Newtona

Napisz funkcję obliczającą wartość symbolu Newtona:
```haskell
newtonSymbol :: Integer -> Integer -> Integer
```

Wskazówka: można skorzystać ze wzoru:

$$\binom{n}{k}={\frac {\prod _{i=1}^{k}(n-i+1)}{\prod _{i=1}^{k}i}}=\prod _{i=1}^{k}{\frac {n-i+1}{i}}$$

---

(exp-approx)=

## Zadanie 6. Funkcja wykładnicza
Napisz funkcję o sygnaturze
```haskell
expApprox :: Int -> Double -> Double
```
obliczającą przybliżenie $e^x$ jako $n$-ty wyraz szeregu:

$$1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \ldots$$

### Uwaga

Sumę $n$ pierwszych wyrazów szeregu da się wyznaczyć mając wyłącznie sumę $n-1$ pierwszych wyrazów oraz wartości $x$ i $n$. Wystarczy policzyć wartość $\frac{x^n}{n!}$ i dodać do tej sumy. Niestety będzie to wymagało obliczenia od nowa wartości $x^n$ oraz $n!$ bez wykorzystania tego, że wcześniej liczona już była wartość $x^{n-1}$ oraz $(n-1)!$. To nie jest najlepsze rozwiązanie. Zamiast tego skorzystaj z poniższych wskazówek:

### Wskazówki

* Napisz funkcję, która dla wyrazu ciągu nr $n-1$ oraz wartości $x$ i $n$ obliczy $n$-ty wyraz ciągu.
* Napisz funkcję, która działa tak jak `expApprox`, ale zwraca krotkę `(s, el)`, gdzie `s` jest szukaną sumą, a `el` jest ostatnim elementem ciągu (ostatnim składnikiem sumy).
* Użyj ostatniej funkcji do implementacji funkcji `expApprox`.

---

(robot-moves)=
## Zadanie 7. Kodowanie ciągu ruchów robota

Robot porusza się po nieskończonej planszy, gdzie każde pole jest identyfikowane przez parę współrzędnych całkowitych `(x, y)`. Początkowa pozycja robota to `(0, 0)`.

Każdy ruch jest wykonywany w jednym z czterech kierunków, zakodowanych jako dwubitowe liczby binarne:

* `00` (0 dziesiętnie) — ruch w prawo: `(x+1, y)`
* `01` (1 dziesiętnie) — ruch w dół: `(x, y-1)`
* `10` (2 dziesiętnie) — ruch w lewo: `(x-1, y)`
* `11` (3 dziesiętnie) — ruch w górę: `(x, y+1)`

Ciąg ruchów jest zakodowany jako pojedyncza liczba całkowita. Każdy ruch zajmuje 2 bity, a cała sekwencja jest konkatenacją tych dwubitowych wartości.

Aby uniknąć niejednoznaczności związanej z wiodącymi zerami, na początku zapisu binarnego (jako najbardziej znaczący bit) dopisana jest dodatkowa jedynka.

### Przykład

Ciąg ruchów: 0, 1, 3, 3, 3, 1, 1, 2, 0, 0, 1

Binarnie:

* Znacznik początku: `1`
* `0` → `00`
* `1` → `01`
* `3` → `11`
* `3` → `11`
* `3` → `11`
* `1` → `01`
* `1` → `01`
* `2` → `10`
* `0` → `00`
* `0` → `00`
* `1` → `01`

Konkatenacja:

* binarnie: `10001111111010110000001`
* dziesiętnie: `4715905`

Napisz funkcję w Haskellu:

```haskell
type Position = (Int, Int)

decodeMoves :: Integer -> Position
```

Funkcja przyjmuje liczbę całkowitą reprezentującą zakodowany ciąg ruchów i zwraca krotkę `(x, y)` z końcową pozycją robota po wykonaniu wszystkich ruchów.

### Przykłady użycia

```haskell
ghci> decodeMoves 4715905
(2,-1)
```

### Uwagi

* Zakładamy, że liczba wejściowa jest nieujemna.
* Kolejność przetwarzania ruchów w funkcji nie ma znaczenia dla wyniku — końcowa pozycja zależy wyłącznie od liczby ruchów w każdym kierunku.
