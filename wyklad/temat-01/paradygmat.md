# Programowanie funkcyjne

&bdquo;Programowanie funkcyjne&rdquo; a nie &bdquo;programowanie funkcjonalne&rdquo; &mdash; to używana czasem kalka z angielskiego &bdquo;functional programming&rdquo;.

## Różne istotne pojęcia

* Pojęcie **funkcji** w matematyce i w programowaniu.

* **Funkcja czysta** (ang. *pure function*)
    Funkcja czysta jest implementacją funkcji rozumianej jak funkcja w matematyce i nie robi nic poza obliczeniem wartości tej funkcji. Wartość zależy wyłącznie od argumentów wywołania. W szczególności:
    - nie ma zewnętrznych zależności (jak np. zależność od zmiennych globalnych, czy odczyt danych przez interakcję ze środowiskiem),
    - nie ma efektów ubocznych (zmiany wartości zewnętrznych zmiennych, brak zmiany zewnętrznego środowiska, np. przez instrukcje wejścia/wyjścia).

* Podział na **instrukcje** i **wyrażenia** w programach imperatywnych (w wielu językach są konstrukcje będące równocześnie jednym i drugim, np. `i++` w C/C++)

* **Przejrzystość referencyjna** (ang. *referential transparency*)

    Oznacza mniej więcej, że wartość wyrażenia nie zależy od kontekstu jego użycia (tzw. **określoność**, ang. *definiteness*) i że każde wywołanie funkcji możemy zastąpić jej rozwinięciem/definicją (tzw. **rozwijalność**, ang. *unfoldability*).

    Mamy definicję:

    ```python
    def hypotenuse(a, b):
        return math.sqrt(a * a + b * b)
    ```

    Wyrażenie `hypotenuse(3, 4)` będzie miało zawsze wartość `5`. Oznacza to m\.in., że zastąpienie go w dowolnymi miejscu programu przez `5` nie zmieni znaczenia programu. Wyrażenie `hypotenuse(x, y)` możemy też zawsze zastąpić przez `math.sqrt(x * x + b * b)` bez zmiany znaczenia programu.

    Wyrażenie `i++` nie jest przejrzyste referencyjnie.

    W językach czysto funkcyjnych wszystkie wyrażenia są przejrzyste referencyjnie.

## Paradygmat funkcyjny

* Wykonanie programu polega na obliczeniu wartości wyrażenia. Wyrażenie jest wywołaniem funkcji (czystej funkcji) z argumentami. Operatory (np. arytmetyczne) też są funkcjami tylko mają inną składnię. W programie nie ma instrukcji.

* Brak zmiany stanu (brak instrukcji podstawienia)

    Konsekwencją braku zmiany stanu jest m\.in. brak pętli jako konstrukcji programistycznej. Pętla nie ma sensu, bo bez zmiany stanu wartość warunku nigdy się nie zmieni.

* Środkiem wyrazu algorytmów, które w językach imperatywnych wyrażane są za pomocą pętli jest **rekurencja**.

    Kluczowa jest odpowiednia konstrukcja algorytmów rekurencyjnych w sposób, który nie powoduje zwiększonej złożoności pamięciowej (i w praktyce przepełnienia stosu programu), czyli [**rekurencja ogonowa**](./rekurencja) (ang. *tail recursion*).
