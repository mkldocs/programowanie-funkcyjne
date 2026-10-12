# Listy

## Funkcyjne struktury danych
    
Efektywność wielu struktur danych bazuje na możliwości zmiany stanu. Tak jest choćby w przypadku tablic.
Jest to jeden z powodów tego, że techniki funkcyjne nie do wszystkiego są dobrym wyborem. Struktury danych używane w programowaniu funkcyjnym muszą umożliwiać efektywne operacje mimo braku możliwości zmiany stanu. Operacje, które w językach imperatywnych implementowane są za pomocą zmiany stanu, w językach funkcyjnych tworzą nowe wersje danych bez niszczenia starych wersji. Są to tzw. **trwałe struktury danych** (ang. *persistent data structures*).

Jako przykład weźmy podstawowe struktury danych takie jak **stos** (ang. *stack*, *LIFO* &mdash; *last in, first out*) i **kolejka** (ang. *queue*, *FIFO* &mdash; *first in, first out*). Obie te struktury mogą być zaimplementowane jako **lista wiązana jednokierunkowa** (ang. *singly linked list)*.

![Współdzielenie danych](listy.svg)


Na dalszych wykładach omówione będą różne mechanizmy Haskella umożliwiające definiowanie własnych typów danych. Tutaj omówiona będzie podstawowa struktura danych pasującą do przetwarzania funkcyjnego czyli **lista**. Definicja i składnia listy jest wbudowana w język Haskell.

W językach funkcyjnych model listy i sposób przetwarzania list może różnić się od wyobrażenia o liście znanego z innych języków (Python, Java).

## Model listy w językach funkcyjnych

Lista jest, podobnie jak w innych językach, sekwencją elementów. W językach statycznie typowanych zwykle wszystkie elementy listy muszą być tego samego typu.

### Definicja listy

Lista w językach funkcyjnych jest zdefiniowana rekurencyjnie.
Mamy dwa przypadki.
- Lista może być pusta. 

    **Składnia:** Pustą listę zapisujemy jako `[]`.
- Lista może być parą złożoną z:
    - Pierwszego elementu listy nazywanego **głową** (ang. *head*).
    - Reszty listy nazywanej **ogonem** (ang. *tail*). Ogon listy jest listą.

    **Składnia:** Listę złożoną z głowy `h` i ogona `t` zapisujemy jako `h:t`. 

### Typ listy

Typ listy elementów typu `a` zapisujemy jako `[a]`

**Uwaga:** Głowa i ogon listy mają różny typ. Ogon listy jest tego samego typu co cała lista. Jeżeli głowa ma typ `a`, to typem ogona jest lista elementów typu `a` czyli `[a]`.


## Składnia list

**Lukier składniowy** (ang. *syntactic sugar*) dla list:

Zamiast pisać `3:()

### Listy w definicjach typów (sygnaturach)

* Napisy jako listy znaków


### Użycie wzorców

* Użycie wzorców do rozpoznania struktury a nie tylko prostych wartości.

* Wzorzec dla głowy i ogona

* Przykład: wyciągnięcie z listy pierwszych trzech elementów za pomocą wzorca.

    Dlaczego `f [x1,x2,x3] = ` nie działa poprawnie?

    `f (x1:x2:x3:t) = ...` &mdash; czy to zadziała dla wszystkich list, które mają trzy lub więcej elementów? Do czego dopasuje się `t` w przypadku listy dokładnie trójelementowej?

Funkcje `head` i `tail` i ich przykładowe definicje. Przykład na niekompletny wzorzec. Jak moglibyśmy uzupełnić definicje używając jawnie `error`.



### Przetwarzanie list w sposób rekurencyjny

Można pisać rekurencyjnie używając funkcji `head` i `tail` do odwoływania się do głowy i ogona listy, ale raczej preferowanym (i zwykle dużo zwięźlejszym i czytelniejszym) sposobem jest przetwarzanie list z użyciem dopasowania wzorców.

Dlaczego ich odpowiedniki, czyli `last` i `init` nie są aż tak ważne w kontekście przetwarzania list.

* Implementacja (zastanowić się nad sygnaturami):
    - `head` i `tail`
    - `last` i `init`

    - `append` (odpowiednik `++`). Pokazać, że można po prostu `append = (++)`

* Współdzielenie pamięci w strukturach danych na przykładzie list.

    Czym różni się np. &bdquo;wstawienie&rdquo; elementu na początek listy od &bdquo;wstawienia&rdquo; na koniec.

    Jakie problemy może powodować współdzielenie danych przez dwie struktury? Czy jest to istotne w językach funkcyjnych?

* Listy wielowymiarowe (listy list)

* Wyrażenia z zakresami: `[begin..end]`, `[begin..]` (wspomnieć o leniwej ewaluacji, ale na razie nie rozwijać tematu), `[begin,step..end]`, `[begin,step..]`.

* Wyrażenia listowe (ang. *list comprehension*)

* Klasa `Enum` w kontekście wyrażeń listowych z zakresami

