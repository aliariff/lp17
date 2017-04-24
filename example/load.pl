/* facts */

female(monika).
female(karin).
female(renate).
female(susanne).
female(aline).

male(werner).
male(klaus).
male(gerd).
male(peter).
male(dominique).

married(werner, monika).
married(gerd, renate).
married(klaus, susanne).

motherOf(monika, karin).
motherOf(monika, klaus).
motherOf(renate, susanne).
motherOf(renate, peter).
motherOf(susanne, aline).
motherOf(susanne, dominique).

human(X).

/* rules */
fatherOf(F, C) :- married(F, W), motherOf(W, C).

parent(X, Y) :- motherOf(X, Y).
parent(X, Y) :- fatherOf(X, Y).

ancestor(V, X) :- parent(V, X).
ancestor(V, X) :- parent(V, Y), ancestor(Y, X).
