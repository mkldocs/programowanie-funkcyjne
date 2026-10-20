-- Tak naprawdę funkcja insert zaimplementowana w ten sposób nie różni się niczym od funkcji, która została użyta w jej definicji, czyli od operatora `:`. Jej implementacja mogłaby nawet wyglądać tak: `insert = (:)` (zostanie to dokładniej wyjaśnione na wykładzie dotyczącym funkcji wyższych rzędów).

insert :: a -> [a] -> [a]
insert x lst = x:lst
