factorial(0, 1).
factorial(N, Fn) :-
	N > 0, 
	M is N - 1,
	factorial(M, Fm),
	Fn is N * Fm.


