smaller(0, s(_)).
smaller(s(X), s(Y)) :- smaller(X, Y).

smallerEqual(0, 0).
smallerEqual(0, s(_)).
smallerEqual(s(X), s(Y)) :- smallerEqual(X, Y).

isSorted([_ | []]).
isSorted([X, Y|Z]) :- smallerEqual(X, Y), isSorted([Y|Z]).

bubble([], []).
bubble([X], [X]).
bubble([X, Y|Z], [X|R]) :- smallerEqual(X, Y), bubble([Y|Z], R), !.
bubble([X, Y|Z], [Y|R]) :- bubble([X|Z], R).

bubbleSort(L, X) :- isSorted(L), L \= X, bubbleSort(L, L).
bubbleSort(L, X) :- bubble(L, Y), L \= Y, bubbleSort(Y, X), !.
bubbleSort(X, X).

equal(0, 0).
equal(s(X), s(Y)) :- equal(X, Y).

notUnique([]) :- false.
notUnique([_ | []]) :- false.
notUnique([A, B | _]) :- equal(A, B), !.
notUnique([_, B | XS]) :- notUnique([B | XS]).

duplicates(L) :- bubbleSort(L, X), notUnique(X).

increment(0, s(0)).
increment(s(X), s(s(X))).

hasLast([X], X).
hasLast([_|XS], Y) :- hasLast(XS, Y).

count(_, [], 0).
count(E, [X|L], Occ) :- equal(E, X), count(E, L, Occ1), increment(Occ1, Occ), !.
count(E, [_|L], Occ) :- count(E, L, Occ).

solve(_, [], []) :- !.
solve(C, L, []) :- hasLast(L, T), smaller(T, C), !.
solve(C, L, [Occ|X]) :- count(C, L, Occ), increment(C, R), solve(R, L, X).

countNumbers(L, X) :- bubbleSort(L, R), solve(0, R, X).

:- begin_tests(exercise).

test(smaller) :- smaller(0, s(0)). /* 0 < 1 */
test(smaller) :- smaller(s(0), s(s(0))). /* 1 < 2 */
test(smaller, fail) :- smaller(0, 0). /* 0 < 0 */
test(smaller, fail) :- smaller(s(0), s(0)). /* 1 < 1 */
test(smaller, fail) :- smaller(s(0), 0). /* 1 < 0 */
test(smaller, fail) :- smaller(s(s(0)), s(0)). /* 2 < 1 */

test(smallerEqual) :- smallerEqual(0, s(0)). /* 0 <= 1 */
test(smallerEqual) :- smallerEqual(s(0), s(s(0))). /* 1 <= 2 */
test(smallerEqual, [nondet]) :- smallerEqual(0, 0). /* 0 <= 0 */
test(smallerEqual, [nondet]) :- smallerEqual(s(0), s(0)). /* 1 <= 1 */
test(smallerEqual, fail) :- smallerEqual(s(0), 0). /* 1 <= 0 */
test(smallerEqual, fail) :- smallerEqual(s(s(0)), s(0)). /* 2 <= 1 */

test(isSorted, [nondet]) :- isSorted([0, s(0), s(0), s(s(s(0)))]). /* 0 <= 1 <= 1 <= 3 */
test(isSorted, fail) :- isSorted([0, s(s(0)), s(0), s(s(s(0)))]). /* 0 <= 2 <= 1 <= 3 */

test(bubble, all(X == [[]])) :- bubble([], X).
test(bubble, all(X == [[s(0), s(0), 0, s(s(0))]])) :- bubble([s(0), s(s(0)), s(0), 0], X).
test(bubble, all(X == [[0, s(0), s(0), s(s(s(0)))]])) :- bubble([0, s(0), s(0), s(s(s(0)))], X).

test(bubbleSort, all(X == [[]])) :- bubbleSort([], X).
test(bubbleSort, all(X == [[0, s(0), s(0), s(s(0))]])) :- bubbleSort([s(0), s(s(0)), s(0), 0], X).

test(duplicates) :- duplicates([s(0), s(s(0)), s(0), 0]).
test(duplicates, fail) :- duplicates([s(s(0)), s(0), 0]).
test(duplicates, fail) :- duplicates([]).

test(countNumbers, all(X == [[s(0), s(s(0)), 0, 0, s(0)]])) :- countNumbers([s(0), s(s(s(s(0)))), s(0), 0], X).
test(countNumbers, all(X == [[s(0), s(s(0)), 0, s(0)]])) :- countNumbers([s(0), s(s(s(0))), s(0), 0], X).
test(countNumbers, all(X == [[s(s(s(0)))]])) :- countNumbers([0, 0, 0], X).
test(countNumbers, all(X == [[]])) :- countNumbers([], X).

:- end_tests(exercise).
