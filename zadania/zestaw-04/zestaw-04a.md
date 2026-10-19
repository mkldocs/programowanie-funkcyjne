# Funkcje wyższych rzędów: rekurencja

**Tematy:** funkcje wyższych rzędów

---

(rec-seq)=
## Zadanie. Ciąg rekurencyjny

Mamy ciąg rekurencyjny zdefiniowany w nastepujący sposób:
$$
\left\{
\begin{aligned}
    a_0 &= c \\
    a_n &= f(n, a_{n-1}), \quad \text{dla } n > 0
\end{aligned}
\right.
$$

Napisz funkcję `recSequence c f n` zwracającą $n$-ty wyraz tego ciągu. Parametry `c` i `f` oznaczają stałą i funkcję użyte w definicji.

### Silnia
Korzystając z funkcji `recSequence` zaimplementuj funkcję obliczającą silnię ze zwojego argumentu.

---

(trapezoidal)=
## Zadanie. Całkowanie numeryczne metodą trapezów

### Metoda trapezów

Całkowanie numeryczne pozwala na przybliżone obliczanie wartości pola pod wykresem funkcji na zadanym przedziale, czyli wartości całek oznaczonych $\int_a^b f(x) \, dx$.

Jest szczególnie przydatne, gdy [funkcja pierwotna](https://pl.wikipedia.org/wiki/Funkcja_pierwotna) funkcji $f$ jest trudna lub niemożliwa do wyznaczenia w postaci analitycznej.

[Metoda trapezów](https://pl.wikipedia.org/wiki/Wz%C3%B3r_trapez%C3%B3w) (wzór trapezów) polega na przybliżaniu pola pod wykresem funkcji $f$ na przedziale $[a, b]$ sumą pól $n$ trapezów o jednakowej szerokości $h = \frac{b - a}{n}$. Wzór trapezów ma postać:

$$\int_a^b f(x) \, dx \approx h \left( \frac{f(a) + f(b)}{2} + \sum_{i=1}^{n-1} f(a + i \cdot h) \right)$$

Napisz funkcję realizującą całkowanie numeryczne tą metodą
```haskell
trapezoidal :: (Double -> Double) -> (Double, Double) -> Int -> Double
```
Parametry to
- całkowana funkcja: `f :: Double -> Double`,
- końce przedziału całkowania: `(a, b): (Double, Double)`,
- liczba fragmentów, na które ma być podzielony przedział: `n :: Int`.

### Przybliżanie wartości liczby $\pi$

Wartość liczby $\pi$ można wyznaczyć, obliczając całkę oznaczoną:

$$\int_0^1 \frac{4}{1 + x^2} \, dx = \pi$$

Napisz funkcję

```haskell
piTrapezoidal :: Int -> Double
```

która dla zadanej liczby fragmentów przedziału oblicza przybliżenie liczby $\pi$ metodą trapezów.

---

(zero-of-a-function)=
## Zadanie. Miejsce zerowe

### Metoda Newtona

W [metodzie Newtona](https://pl.wikipedia.org/wiki/Metoda_Newtona) (metoda stycznych) kolejne przybliżenia miejsca zerowego funkcji $f$ wyznaczane są według wzoru

$$x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$$

Napisz funkcję:
```haskell
newton :: Double -> (Double -> Double) -> (Double -> Double) -> Double
```
obliczającą przybliżone miejsce zerowe funkcji.

* Parametr `x0 :: Double` reprezentuje pierwsze przybliżenie $x_0$.
* Parametry `f` oraz `f'` (oba typu `Double -> Double`) to odpowiednio badana funkcja i jej pochodna.
* Parametr `eps :: Double` określa dokładność ($\epsilon$): wynikiem jest pierwsze przybliżenie $x_{k+1}$ takie, że $\vert{}x_{k+1} - x_k\vert{} < \epsilon$.


### Pierwiastek kwadratowy

Napisz funkcję

```haskell
squareRoot :: Double -> Double
```

zwracającą przybliżenie pierwiastka kwadratowego swojego argumentu obliczone za pomocą funkcji `newton`.

* Wartość $\sqrt{a}$ jest miejscem zerowym funkcji $f(x) = x^2 - a$.
* Pochodna tej funkcji to $f'(x) = 2x$.

Za pierwsze przybliżenie przyjmij $a$.

Wartość $\epsilon$ ma być stałą w funkcji `squareRoot`. Wypróbuj różne wartości.

### Metoda bisekcji

W [metodzie bisekcji](https://pl.wikipedia.org/wiki/Metoda_bisekcji) (metodzie równego podziału) miejsce zerowe funkcji $f$ wyznaczamy, dzieląc przedział na pół i wybierając ten podprzedział, na którego końcach funkcja przyjmuje wartości o różnych znakach.

Napisz funkcję:

```haskell
bisect :: (Double, Double) -> (Double -> Double) -> Double -> Double
```

obliczającą przybliżone miejsce zerowe funkcji w podanym przedziale.

* Pierwszy parametr to krotka `(a, b)` określająca przedział początkowy.
* Parametr `f` reprezentuje badaną funkcję.
* Parametr `eps` określa dokładność: proces podziału powtarzaj do momentu, gdy długość przedziału będzie mniejsza od $\epsilon$ (czyli $\vert{}b - a\vert{} < \epsilon$), a jako wynik zwróć środek ostatniego przedziału, czyli $\frac{a + b}{2}$.

### Pierwiastek kwadratowy metodą bisekcji

Napisz funkcję:
```haskell
squareRootBisect :: Double -> Double
```
obliczającą przybliżenie pierwiastka kwadratowego liczby $a$ za pomocą funkcji `bisect`, przyjmując jako przedział początkowy $(0, a)$.

---

