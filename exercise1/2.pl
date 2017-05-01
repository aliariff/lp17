eats(rabbit, grass).
eats(grasshopper, grass).
eats(mouse, grass).
eats(mouse, corn).
eats(mouse, grasshopper).
eats(fox, rabbit).
eats(fox, mouse).

plant(grass).
plant(corn).

animal(rabbit).
animal(grasshopper).
animal(mouse).
animal(fox).

/* has_enemy(X) :- animal(X), eats(Y, X). */
competitors(X, Y) :- animal(X), animal(Y), eats(X, Z), eats(Y, Z).

:- begin_tests(query).

test(mouse, all(F == [grass, corn])) :- eats(mouse, F), plant(F).
test(grasshopper, all(C == [mouse])) :- competitors(grasshopper, C), eats(C, grasshopper).

:- end_tests(query).
