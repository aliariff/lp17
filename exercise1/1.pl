evolvedFrom(cat, miacis).
evolvedFrom(hyena, miacis).
evolvedFrom(weasel, miacis).
evolvedFrom(cynodictis, miacis).

evolvedFrom(raccoon, cynodictis).
evolvedFrom(bear, cynodictis).
evolvedFrom(tomarctus, cynodictis).

evolvedFrom(fox, tomarctus).
evolvedFrom(wolf, tomarctus).
evolvedFrom(dog, tomarctus).

evolvedFromSameCreature(A, B) :- evolvedFrom(A, X), evolvedFrom(B, X).

:- use_module(library(tabling)).
:- table descendsFrom/2.

descendsFrom(A, C) :- evolvedFrom(A, C).
descendsFrom(A, C) :- evolvedFrom(A, B), evolvedFrom(B, C).
