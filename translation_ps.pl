?- [problems_solutions].

translation_ps:- 
	tell('problems_solutions.txt'),
	translation_hasSolution, nl,
	told.

translation_hasSolution:-
	findall( hasSolution(X,Y), hasSolution(oid(X,_),oid(Y,_)), L),
	translation_hasSolution(L).
translation_hasSolution([]).
translation_hasSolution([hasSolution(X,Y)|T]):-
	 write(''''), write(X), write(''''), write(' : '), write(''''), write(Y), write(''''), write(' .'),nl,
	translation_hasSolution(T).