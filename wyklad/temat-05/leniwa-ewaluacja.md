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
    - użycie gorliwej ewaluacji w Haskellu
    - `foldl'` &mdash; `foldl` z gorliwą ewaluacją akumulatora. Praktycznie zawsze jego użycie jest sensowniejsze niż `foldl`. Kiedyś funkcji `foldl'` nie było w `Prelude` i trzeba było ją importować z `Data.List`. Teraz już jest.