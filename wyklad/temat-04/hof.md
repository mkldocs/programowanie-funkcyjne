# Funkcje wyższych rzędów

## Motywacja

- Przykład rekurencji ogonowej na przykładzie sumowania Kahana
    - Wersja z funkcją na sztywno wpisaną w kodzie
    - Funkcja jako parametr

## Pojęcie funkcji wyższych rzędów

- Funkcja, której parametrem lub wynikiem jest inna funkcja

    **Uwaga:** Nie chodzi o użycie **wywołania** innej funkcji do obliczenia wartości parametru lub wyniku. Jeżeli mamy funkcję `f :: Int -> Int`, to użycie jej np. w `g (f 3) 4` nie oznacza, że `g` jest funkcją wyższego rzędu. Za to możliwość wywołania `h f 3` oznacza, że `h` taką funkcją jest.

- Funkcje listowe: `map` i `filter`

- Wyrażenia lambda, również wieloargumentowe, z dopasowaniem wzorców
    - `\x -> x^2 + 1`
    - `map (\x -> x^2 + 1) [10,20,30]`
    - `filter (\x -> odd x && x < 10) [11,2,3,43,5,60]` 

- Rachunek lambda
    - abstrakcja &mdash; odpowiednik definicji funkcji
    - aplikacja &mdash; odpowiednik wywołania funkcji
    - &#946;-redukcja (redukcja beta) &mdash; odpowiednik jednego kroku obliczeń &mdash; zastosowanie funkcji do argumentów przez zastąpienie wywołania przez definicję z parametrami zastąpionymi przez argumenty wywołania, np.

        `(\x -> x + 5) 8` &xrarr; `8 + 5`

        Czasem w wyrażeniu możliwych jest wiele &#946;-redukcji (temat ten będzie jeszcze poruszony przy okazji omawiania *leniwej ewaluacji*). Np. dla


- Częściowa ewaluacja, currying

- operatory jako funkcje dwuargumentowe, sekcje

- Różne przydatne rzeczy (z przykładową implementacją)
    - `.`
    - `flip`
    - `$` &mdash; pozornie nieprzydatne, ale
        - ułatwia czasem zapis dłuższych wywołań
            - przykłady:
                - `f (g x y z)` -> `f $ g x y z`
                - `f (g (h x y z))` -> `f $ g $ h x y z`
        - przydatne w funkcjach wyższych rzędów, np. wywołanie różnych funkcji z tym samym argumentem: `map ($ 0.5) [sin,cos,tan]`