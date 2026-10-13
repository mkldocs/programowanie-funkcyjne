# Podsumowanie

## Pojęcia, które trzeba znać i rozumieć

* ...
* ...

## Co trzeba umieć

* ...

## Ćwiczenia sprawdzające

1. Pierwszy element listy jest jej głową. Lista pozostałych elementów &mdash; ogonem. Drugi element listy jest głową jej ogona. Lista złożona ze wszystkich elementów listy poza pierwszymi dwoma jest ogonem ogona tej listy.
    - Opisz w podobny sposób trzeci i czwarty element listy oraz listę bez pierwszych trzech elementów.
    - Używająć funkcji `tail` i `head` napisz wyrażenia zwracające te dane dla listy `lst` (przy założeniu, że ma wystarczająco dużo elementów).
    - Napisz wzorce umożliwiające wyciągnięcie odpowiednich elementów z listy.

2. Napisz funkcję `null :: [a] -> Bool` zwracającą informację, czy lista jest pusta:
    ```haskell
    ghci> null []
    True
    ghci> null [1,2,3]
    False
    ```
    **Uwaga:** W module `Prelude` jest nieco ogólniejsza funkcja `null` mogąca działać również na innych strukturach danych. Pamętaj, żeby ukryć ją za pomocą 
        
    ```haskell
    import Prelude hiding (null)
    ```

3. Wzorując się na implementacji funkcji zwracającej długość listy, napisz funkcje:
    - zwracającą sumę elementów listy,
    - zwracającą iloczyn elementów listy.
    
    **Informacja:** W module `Prelude` są funkcje `sum` i `product`. Podobnie jak `null` działają nie tylko na listach.

4. Zastanów się jak zaimplementować własne wersje funkcji `last` (ostatni element) i `init` (lista wszystkich elementów oprócz ostatniego) z `Prelude`.
