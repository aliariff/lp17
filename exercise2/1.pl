smaller(0, s(_)).
smaller(s(X), s(Y)) :- smaller(X, Y).

smallerEqual(0, 0).
smallerEqual(0, s(_)).
smallerEqual(s(X), s(Y)) :- smallerEqual(X, Y).

isSorted([]).
isSorted([_]).
isSorted([X, Y | Z]) :- smallerEqual(X, Y), isSorted([Y | Z]).

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

:- end_tests(exercise).
