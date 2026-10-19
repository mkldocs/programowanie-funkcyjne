# Struktura numeru PESEL

Informacje do zadania [Numer PESEL](zestaw-03b/#pesel-validation).

Numer PESEL składa się z 11 cyfr: $D_1 D_2 D_3 D_4 D_5 D_6 D_7 D_8 D_9 D_{10} D_{11}$.

### Data urodzenia

Data urodzenia jest zapisana na pierwszych 6 cyfrach:

* $D_1D_2$ &mdash; dwie ostatnie cyfry roku,
* $D3D_4$ — zmodyfikowany miesiąc w zależności od stulecia,
* $D_5 D_6$ — dzień miesiąca.

Aby odróżnić stulecia, do numeru miesiąca (1&ndash;12) dodaje się odpowiednią wartość według poniższej tabeli:

| Lata urodzenia | Modyfikacja miesiąca | Zakres wyniku |
| --- | --- | --- |
| 1800 – 1899 | $+ 80$ | 81 – 92 |
| 1900 – 1999 | $+ 0$ | 01 – 12 |
| 2000 – 2099 | $+ 20$ | 21 – 32 |
| 2100 – 2199 | $+ 40$ | 41 – 52 |
| 2200 – 2299 | $+ 60$ | 61 – 72 |

**Przykład:**
U osoby urodzonej 15 maja 2004 roku miesiąc wynosi $5 + 20 = 25$, co daje początek numeru PESEL: 042515.

---

### Płeć

Płeć jest zapisana na dziesiątej cyfrze numeru PESEL ($D_{10}$):

* cyfra parzysta (0, 2, 4, 6, 8) oznacza płeć żeńską,
* cyfra nieparzysta (1, 3, 5, 7, 9) oznacza płeć męską.

---

### Cyfra kontrolna

Jedenasta cyfra ($D_{11}$) jest cyfrą kontrolną obliczaną na podstawie pierwszych 10 cyfr w następujący sposób:

1. Obliczana jest suma iloczynów cyfr i odpowiadających im wag (1, 3, 7, 9, 1, 3, 7, 9, 1, 3):

    $$S = D_1 + 3D_2 + 7D_3 + 9D_4 + D_5 + 3D_6 + 7D_7 + 9D_8 + D_9 + 3D_{10}$$


2. Wyznaczana jest reszta z dzielenia sumy przez 10:

    $$M = S \bmod 10$$


3. Cyfra kontrolna wynosi:

    $$D_{11} = (10 - M) \bmod 10$$

---

**Na podstawie:**
* [Czym jest numer PESEL &mdash; Gov.pl](https://www.gov.pl/web/gov/czym-jest-numer-pesel)

