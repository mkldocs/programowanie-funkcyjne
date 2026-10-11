# Typy i wyrażenia logiczne, podstawowe konstrukcje

## Do przejrzenia przed laboratoriami:

* Typy i wyrażenia logiczne ([Wikibooks](https://en.wikibooks.org/wiki/Haskell/Truth_values))
* Wyrażenie `if-then-else`, wyrażenie `let-in`, np.

    ```haskell
    numOfSolutions a b c =
        let
            delta = b ^ 2 - 4 * a * c
        in
            if delta < 0 then 0
            else
                if delta == 0 then 1
                else 2
    ```
* Definicja funkcji z prostym dopasowaniem wzorców, np.
    ```haskell
    f 0     = 0
    f (-1)  = 1
    f 1     = 2
    f x     = x^2 - 1

    point_position 0 0 = "środek układu"
    point_position _ 0 = "punkt na osi OX"
    point_position 0 _ = "punkt na osi OY"
    point_position _ _ = "punkt poza osiami układu"
    ```
* Użycie &bdquo;strażników&rdquo; (ang. *guards*) w definicji funkcji, np.
    ```haskell
    sign x
        | x < 0     = -1
        | x == 0    = 0
        | otherwise = 1

    leapYear y
        | mod y 400 == 0 = True
        | mod y 100 == 0 = False
        | mod y 4 == 0   = True
        | otherwise      = False

    daysInMonth _ 1 = 31
    daysInMonth y 2
        | leapYear y = 29
        | otherwise  = 28
    daysInMonth _ 3 = 31
    daysInMonth _ 4 = 30
    daysInMonth _ 5 = 31
    daysInMonth _ 6 = 30
    daysInMonth _ 7 = 31
    daysInMonth _ 8 = 31
    daysInMonth _ 9 = 30
    daysInMonth _ 10 = 31
    daysInMonth _ 11 = 30
    daysInMonth _ 12 = 31
    ```
* Konstrukcja `where`, np.
    ```haskell
    numOfSolutions a b c
        | delta < 0     = 0
        | delta == 0    = 1
        | otherwise     = 2
        where
            delta = b ^ 2 - 4 * a * c
    ```

## Pomocne materiały:
* Typy i wyrażenia logiczne &mdash; [Haskell/Truth values &mdash; Wikibooks](https://en.wikibooks.org/wiki/Haskell/Truth_values)
* Wyrażenie `if-then-else`, wyrażenie `let-in` &mdash; [Let it be &mdash; Syntax in Funcions &mdash; Learn You a Haskell ...](https://learnyouahaskell.github.io/syntax-in-functions.html#let-it-be)
* Definicja funkcji z prostym dopasowaniem wzorców &mdash; [Pattern matching &mdash; Syntax in Funcions &mdash; Learn You a Haskell ...](https://learnyouahaskell.github.io/syntax-in-functions.html#let-it-be)
* Użycie &bdquo;strażników&rdquo; (ang. *guards*) w definicji funkcji &mdash; [Guards, guards! &mdash; Syntax in Funcions &mdash; Learn You a Haskell ...](https://learnyouahaskell.github.io/syntax-in-functions.html#guards-guards)
* Konstrukcja `where` &mdash; [Where!? &mdash; Syntax in Funcions &mdash; Learn You a Haskell ...](https://learnyouahaskell.github.io/syntax-in-functions.html#where)
