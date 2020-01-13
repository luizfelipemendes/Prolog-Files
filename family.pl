% Fatos sobre a familia

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(ann).
female(pat).
female(liz).
male(bob).
male(tom).
male(jim).

% Definindo pai e mae
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% Relacao de ancestral definida recursivamente
ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- mother(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).
ancestor(X, Y) :- mother(X, Z), ancestor(Z, Y).
