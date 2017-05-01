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
descendsFrom(A, C) :- evolvedFrom(A, B), descendsFrom(B, C).

:- begin_tests(descendsFrom).

/* true cases */
test(descendsFrom) :- descendsFrom(cat, miacis).
test(descendsFrom) :- descendsFrom(hyena, miacis).
test(descendsFrom) :- descendsFrom(weasel, miacis).
test(descendsFrom) :- descendsFrom(cynodictis, miacis).
test(descendsFrom) :- descendsFrom(raccoon, miacis).
test(descendsFrom) :- descendsFrom(raccoon, cynodictis).
test(descendsFrom) :- descendsFrom(bear, miacis).
test(descendsFrom) :- descendsFrom(bear, cynodictis).
test(descendsFrom) :- descendsFrom(tomarctus, miacis).
test(descendsFrom) :- descendsFrom(tomarctus, cynodictis).
test(descendsFrom) :- descendsFrom(fox, cynodictis).
test(descendsFrom) :- descendsFrom(fox, tomarctus).
test(descendsFrom) :- descendsFrom(wolf, cynodictis).
test(descendsFrom) :- descendsFrom(wolf, tomarctus).
test(descendsFrom) :- descendsFrom(dog, cynodictis).
test(descendsFrom) :- descendsFrom(dog, tomarctus).
test(descendsFrom) :- descendsFrom(fox, miacis).
test(descendsFrom) :- descendsFrom(wolf, miacis).
test(descendsFrom) :- descendsFrom(dog, miacis).

/* false cases */
test(descendsFrom, fail) :- descendsFrom(cat, cat).
test(descendsFrom, fail) :- descendsFrom(cat, hyena).
test(descendsFrom, fail) :- descendsFrom(cat, weasel).
test(descendsFrom, fail) :- descendsFrom(cat, cynodictis).
test(descendsFrom, fail) :- descendsFrom(cat, raccoon).
test(descendsFrom, fail) :- descendsFrom(cat, bear).
test(descendsFrom, fail) :- descendsFrom(cat, tomarctus).
test(descendsFrom, fail) :- descendsFrom(cat, fox).
test(descendsFrom, fail) :- descendsFrom(cat, wolf).
test(descendsFrom, fail) :- descendsFrom(cat, dog).
test(descendsFrom, fail) :- descendsFrom(miacis, cat).
test(descendsFrom, fail) :- descendsFrom(miacis, miacis).
test(descendsFrom, fail) :- descendsFrom(miacis, hyena).
test(descendsFrom, fail) :- descendsFrom(miacis, weasel).
test(descendsFrom, fail) :- descendsFrom(miacis, cynodictis).
test(descendsFrom, fail) :- descendsFrom(miacis, raccoon).
test(descendsFrom, fail) :- descendsFrom(miacis, bear).
test(descendsFrom, fail) :- descendsFrom(miacis, tomarctus).
test(descendsFrom, fail) :- descendsFrom(miacis, fox).
test(descendsFrom, fail) :- descendsFrom(miacis, wolf).
test(descendsFrom, fail) :- descendsFrom(miacis, dog).
test(descendsFrom, fail) :- descendsFrom(hyena, cat).
test(descendsFrom, fail) :- descendsFrom(hyena, hyena).
test(descendsFrom, fail) :- descendsFrom(hyena, weasel).
test(descendsFrom, fail) :- descendsFrom(hyena, cynodictis).
test(descendsFrom, fail) :- descendsFrom(hyena, raccoon).
test(descendsFrom, fail) :- descendsFrom(hyena, bear).
test(descendsFrom, fail) :- descendsFrom(hyena, tomarctus).
test(descendsFrom, fail) :- descendsFrom(hyena, fox).
test(descendsFrom, fail) :- descendsFrom(hyena, wolf).
test(descendsFrom, fail) :- descendsFrom(hyena, dog).
test(descendsFrom, fail) :- descendsFrom(weasel, cat).
test(descendsFrom, fail) :- descendsFrom(weasel, hyena).
test(descendsFrom, fail) :- descendsFrom(weasel, weasel).
test(descendsFrom, fail) :- descendsFrom(weasel, cynodictis).
test(descendsFrom, fail) :- descendsFrom(weasel, raccoon).
test(descendsFrom, fail) :- descendsFrom(weasel, bear).
test(descendsFrom, fail) :- descendsFrom(weasel, tomarctus).
test(descendsFrom, fail) :- descendsFrom(weasel, fox).
test(descendsFrom, fail) :- descendsFrom(weasel, wolf).
test(descendsFrom, fail) :- descendsFrom(weasel, dog).
test(descendsFrom, fail) :- descendsFrom(cynodictis, cat).
test(descendsFrom, fail) :- descendsFrom(cynodictis, hyena).
test(descendsFrom, fail) :- descendsFrom(cynodictis, weasel).
test(descendsFrom, fail) :- descendsFrom(cynodictis, cynodictis).
test(descendsFrom, fail) :- descendsFrom(cynodictis, raccoon).
test(descendsFrom, fail) :- descendsFrom(cynodictis, bear).
test(descendsFrom, fail) :- descendsFrom(cynodictis, tomarctus).
test(descendsFrom, fail) :- descendsFrom(cynodictis, fox).
test(descendsFrom, fail) :- descendsFrom(cynodictis, wolf).
test(descendsFrom, fail) :- descendsFrom(cynodictis, dog).
test(descendsFrom, fail) :- descendsFrom(raccoon, cat).
test(descendsFrom, fail) :- descendsFrom(raccoon, hyena).
test(descendsFrom, fail) :- descendsFrom(raccoon, weasel).
test(descendsFrom, fail) :- descendsFrom(raccoon, raccoon).
test(descendsFrom, fail) :- descendsFrom(raccoon, bear).
test(descendsFrom, fail) :- descendsFrom(raccoon, tomarctus).
test(descendsFrom, fail) :- descendsFrom(raccoon, fox).
test(descendsFrom, fail) :- descendsFrom(raccoon, wolf).
test(descendsFrom, fail) :- descendsFrom(raccoon, dog).
test(descendsFrom, fail) :- descendsFrom(bear, cat).
test(descendsFrom, fail) :- descendsFrom(bear, hyena).
test(descendsFrom, fail) :- descendsFrom(bear, weasel).
test(descendsFrom, fail) :- descendsFrom(bear, raccoon).
test(descendsFrom, fail) :- descendsFrom(bear, bear).
test(descendsFrom, fail) :- descendsFrom(bear, tomarctus).
test(descendsFrom, fail) :- descendsFrom(bear, fox).
test(descendsFrom, fail) :- descendsFrom(bear, wolf).
test(descendsFrom, fail) :- descendsFrom(bear, dog).
test(descendsFrom, fail) :- descendsFrom(tomarctus, cat).
test(descendsFrom, fail) :- descendsFrom(tomarctus, hyena).
test(descendsFrom, fail) :- descendsFrom(tomarctus, weasel).
test(descendsFrom, fail) :- descendsFrom(tomarctus, raccoon).
test(descendsFrom, fail) :- descendsFrom(tomarctus, bear).
test(descendsFrom, fail) :- descendsFrom(tomarctus, tomarctus).
test(descendsFrom, fail) :- descendsFrom(tomarctus, fox).
test(descendsFrom, fail) :- descendsFrom(tomarctus, wolf).
test(descendsFrom, fail) :- descendsFrom(tomarctus, dog).
test(descendsFrom, fail) :- descendsFrom(fox, cat).
test(descendsFrom, fail) :- descendsFrom(fox, hyena).
test(descendsFrom, fail) :- descendsFrom(fox, weasel).
test(descendsFrom, fail) :- descendsFrom(fox, raccoon).
test(descendsFrom, fail) :- descendsFrom(fox, bear).
test(descendsFrom, fail) :- descendsFrom(fox, fox).
test(descendsFrom, fail) :- descendsFrom(fox, wolf).
test(descendsFrom, fail) :- descendsFrom(fox, dog).
test(descendsFrom, fail) :- descendsFrom(wolf, cat).
test(descendsFrom, fail) :- descendsFrom(wolf, hyena).
test(descendsFrom, fail) :- descendsFrom(wolf, weasel).
test(descendsFrom, fail) :- descendsFrom(wolf, raccoon).
test(descendsFrom, fail) :- descendsFrom(wolf, bear).
test(descendsFrom, fail) :- descendsFrom(wolf, fox).
test(descendsFrom, fail) :- descendsFrom(wolf, wolf).
test(descendsFrom, fail) :- descendsFrom(wolf, dog).
test(descendsFrom, fail) :- descendsFrom(dog, cat).
test(descendsFrom, fail) :- descendsFrom(dog, hyena).
test(descendsFrom, fail) :- descendsFrom(dog, weasel).
test(descendsFrom, fail) :- descendsFrom(dog, raccoon).
test(descendsFrom, fail) :- descendsFrom(dog, bear).
test(descendsFrom, fail) :- descendsFrom(dog, fox).
test(descendsFrom, fail) :- descendsFrom(dog, wolf).
test(descendsFrom, fail) :- descendsFrom(dog, dog).

:- end_tests(descendsFrom).
