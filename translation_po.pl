?- [problems_objects].

translation_po:- 
	tell('problems_objects.txt'),
	translation_hasProblem, nl,
	told.

translation_hasProblem:-
	findall( hasProblem(X,Y,P), hasProblem(cid(X,_),oid(Y,_),P), L),
	translation_hasProblem(L).
translation_hasProblem([]).
translation_hasProblem([hasProblem(X,Y,P)|T]):-
	 write(''''), write(X), write(''''), write('['), write(''''), write(Y), write(''''), write('->{ '),  write(''''), write(P), write(''''),  write(' }]. '),nl,
	translation_hasProblem(T).
