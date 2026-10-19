# Rekurencja i rekurencja ogonowa, dodatkowe zadania

**Tematy**: rekurencja, rekurencja ogonowa

---

(approx-epsilon)=
## Zadanie 1. Przybliżenia funkcji

Napisz wersje [funkcji obliczających przybliżenia funkcji wykładniczej oraz funkcji sinus i cosinus](zestaw-02#exp-approx) kończące obliczenia, gdy moduł ostatniego składnika obliczonej sumy jest mniejszy od wartości zadanej pierwszym parametrem. Funkcje mają mieć sygnatury:
```haskell
expApproxEps :: Double -> Double -> Double
sinApproxEps :: Double -> Double -> Double
cosApproxEps :: Double -> Double -> Double
```

---

(day-change-iter)=
## Zadanie 2. Następne i poprzednie dni

Funkcje z [zadania &bdquo;Następny i poprzedni dzień&rdquo;](zestaw-01/#day-change) wykorzystaj do napisania funkcji 

```haskell
inDays :: Int -> (Int, Int, Int) -> (Int, Int, Int)
daysAgo :: Int -> (Int, Int, Int) -> (Int, Int, Int)
```

Dla argumentów `n` i `d` funkcja `inDays` zwraca dzień następujący `n` dni po dniu `d`.
Funkcja `daysAgo` zwraca dzień następujący `n` dni przed dniem `d`.


zwracających dzień następujący zadaną liczbę dni po zadanym dniu (`inDays`) i przed zadanym dniem (`daysAgo`).

### Przykład użycia

```haskell
ghci> inDays 5 (2023, 12, 31)
(2024,1,5)

ghci> daysAgo 5 (2024, 1, 5)
(2023,12,31)
```

---

(factorial)=
## Zadanie 3. Silnia

Napisz funkcję:
```haskell
factorial :: Integer -> Integer
```

która dla zadanej nieujemnej liczby całkowitej zwróci wartość [silni](https://pl.wikipedia.org/wiki/Silnia) z tej liczby.

### Przykłady użycia

```haskell
ghci> factorial 0
1
ghci> factorial 5
120
```
### Warianty implementacji

Napisz dwie wersje funkcji:

- korzystającą bezpośrednio z definicji rekurencyjnej,
- implementującą algorytm iteracyjny (wykorzystującą rekurencję ogonową).

---

(fibonacci)=
## Zadanie 4. Ciąg Fibonacciego

Napisz funkcję:

```haskell
fib :: Integer -> Integer

```

która dla zadanej nieujemnej liczby całkowitej $n$ zwróci wartość $n$-tego elementu [ciągu Fibonacciego](https://pl.wikipedia.org/wiki/Ci%C4%85g_Fibonacciego).

### Przykłady użycia

```haskell
ghci> fib 0
0
ghci> fib 30
832040
```

### Warianty implementacji

Napisz dwie wersje funkcji:

1. korzystającą bezpośrednio z definicji rekurencyjnej,
2. implementującą algorytm iteracyjny (wykorzystującą rekurencję ogonową).

---

(seq-a)=
## Zadanie 5. Ciąg zdefiniowany rekurencyjnie

Mamy dany ciąg zdefiniowany w następujący sposób:

$$
\left\{
\begin{aligned}
    a_1 &= 1 \\
    a_2 &= 2 \\
    a_3 &= 3 \\
    a_n &= a_{n-3} + 2 a_{n-2} + 3 a_{n-1}, \quad \text{dla } n > 3
\end{aligned}
\right.
$$

Napisz funkcję:

```haskell
seqA :: Integer -> Integer
```

obliczającą $n$-ty element tego ciągu (zakładamy, że $n \ge 1$).

### Przykłady użycia

```haskell
ghci> seqA 1
1
ghci> seqA 3
3
ghci> seqA 4
14
ghci> seqA 5
50
```

---