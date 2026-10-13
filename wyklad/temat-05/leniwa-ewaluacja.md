# Leniwa ewaluacja

TODO:
- leniwa ewaluacja, ścisła ewaluacja
- przypomnienie o strukturach danych i cyklach
    - można jednak zrobić cykl dzięki leniwej ewaluacji
    - dlaczego nie da się mimo wszystko np. zrobić listy dwukierunkowej - to wymaga nie tylko cyklu, ale też zmiany stanu
    - co dają nam cykle: nieskończone struktury danych
- nieskończone struktury danych (na razie listy)

    - przykłady `ones = 1 : ones`, `onesAndTwos = 1 : 2 : onesAndTwos` z obrazkami
    - czy da się zrobić `length` lub `++`? nie są możliwe operacje wymagające osiągnięcia końca listy
    - czy można zrobić `head`? a `tail` (trochę podchwytliwe)?
    - można `take`
    - co będzie z `elem`:
        - `elem 1 ones`
        - `elem 2 ones`
    - przykład z `fib`

- komentarz o koncepcyjnym oddzieleniu generowania danych od ich użycia. to jest zresztą główną motywacją technik leniwych w językach imperatywnych

- leniwa ewaluacja w językach funkcyjnych a leniwa ewaluacja w językach imperatywnych
    - generatory w Pythonie, strumienie w Javie
    - dlaczego proste przeniesienie `fib` na Pythona nie jest efektywne
        - zmiana stanu - skoro generator przechowuje stan, to każde jego utworzenie powoduje powstanie nowego obiektu niezależnego od poprzednich
        - listy mogą współdzielić dane, generatory są destrukcyjne &mdash; po użyciu elementu nie ma do niego dostępu

- leniwa ewaluacja a akumulatory w rekurencji ogonowej
    - ponowna wizualizacja, ale z rzeczywistą kolejnością obliczeń w przypadku leniwej ewaluacji (jawne rozwijanie akumulatora do wyrażenia arytmetycznego i zwijanie go dopiero na końcu)

    ```{literalinclude} ../temat-02/temat-02/factorial_tr.hs
    :lang:haskell
    ```

    Pokazana wizualizacja wyglądała tak:
    ```
    factorial 4
    factorial_hlp 4 0 1
    factorial_hlp 4 1 1
    factorial_hlp 4 2 2
    factorial_hlp 4 3 6
    factorial_hlp 4 4 24
    24
    ```

    Wizualizacją bardziej odpowiadającą rzeczywistości, czyli uwzględniającą leniwą ewaluację, jest:
    ```
    factorial 4
    factorial_hlp 4 0 1
    factorial_hlp 4 1 (1 * (0 + 1))
    factorial_hlp 4 2 ((1 * (0 + 1)) * (1 + 1))
    factorial_hlp 4 3 (((1 * (0 + 1)) * (1 + 1)) * (2 + 1))
    factorial_hlp 4 4 ((((1 * (0 + 1)) * (1 + 1)) * (2 + 1)) * (3 + 1))
    (((1 * (0 + 1)) * (1 + 1)) * (2 + 1)) * (3 + 1)
    ```
    Funkcja zwraca ostatecznie tego typu wyrażenie bez obliczenia jego wartości. Jest ono przechowywane w pamięci jak tzw. **thunk**. Natomiast sam fakt, że podjęta została próba ewaluacji wyrażenia `factorial 4` oznacza, że obliczenie jego wartości zostało wymuszone i obliczenie wartości tego thunka z pewnością też się wykona. Będzie ono wyglądało mniej więcej tak (kolejność obliczania podwyrażeń może być w rzeczywistości nieco inna, ale nie ma to wpływu na ilość pracy potrzebnej do wykonania):
    ```
    (((1 * (0 + 1)) * (1 + 1)) * (2 + 1)) * (3 + 1)
    (((1 * 1) * (1 + 1)) * (2 + 1)) * (3 + 1)
    ((1 * (1 + 1)) * (2 + 1)) * (3 + 1)
    ((1 * 2) * (2 + 1)) * (3 + 1)
    (2 * (2 + 1)) * (3 + 1)
    (2 * 3) * (3 + 1)
    6 * (3 + 1)
    6 * 4
    24
    ```

    Rekurencja ogonowa połączona z leniwą ewaluacją akumulatora jest wręcz uważana za **antywzorzec** (ang. **anti-pattern**).

    Powyższy przykład motywuje konieczność używania czasem w Haskellu mechanizmów wymuszających gorliwą ewaluację. Główną zaletą rekurencji ogonowej jest to, że nie odkłada ona informacji o kolejnych wywołaniach na stosie. Jednak w przypadku leniwej ewaluacji, problem ten zostaje jedynie **przeniesiony ze stosu na stertę**. Zamiast głębokiego stosu wywołań, budujemy gigantyczną, zagnieżdżoną strukturę thunka zajmującą pamięć. 

    Co gorsza, do ewaluacji wyrażenia przechowywanego w thunku i tak musi zostać użyty stos. Oznacza to, że problemu ze stosem tak naprawdę też nie zlikwidowaliśmy, a jedynie odroczyliśmy go w czasie.

    Właśnie z tego powodu rekurencja ogonowa połączona z leniwą ewaluacją akumulatora jest wręcz uważana za **antywzorzec** (ang. **anti-pattern**). Aby algorytm działał optymalnie, należy w takich miejscach wymusić gorliwość, co sprawi, że program zachowa się tak, jak w uproszczonym modelu z pierwszej wizualizacji.

    **Uwaga:** Jeszcze precyzyjniejsze byłoby uwzględnienie w wizualizacji tego, że wyrażenie `i + 1` przekazane jako drugi argument wywołania `factorial_hlp` też nie jest obliczane przed wywołaniem funkcji. Ale sprawdzenie warunku `i < n` na samym początku funkcji wymusza jego natychmiastową ewaluację, więc nie jest to uproszczenie znacząco zmieniające sytuację. Za to wartość wyrażenia w akumulatorze (parametrze `result`) do końca nie jest nigdzie potrzebna.

    - `foldl'` &mdash; `foldl` z gorliwą ewaluacją akumulatora. Praktycznie zawsze jego użycie jest sensowniejsze niż `foldl`. Kiedyś funkcji `foldl'` nie było w `Prelude` i trzeba było ją importować z `Data.List`. Teraz już jest.
