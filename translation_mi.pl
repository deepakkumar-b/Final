?- [main_instances].

translation_mi:- 
	tell('main_instances.txt'),
	translation_isA, nl,
	translation_isA_ext, nl,
	translation_hasAttr_ext, nl,
	translation_hasAttr, nl,
	told.
	
translation_isA:-
	findall( isA(X,Y), isa_ext(cid(X,_),cid(Y,_)), L),
	translation_isA(L).
translation_isA([]).
translation_isA([isA(X,Y)|T]):-
	 write(''''), write(X), write(''''), write(' :: '), write(''''), write(Y), write(''''), write('.'),nl,
	translation_isA(T).

translation_hasAttr:-
	findall( hasAttr(X,Z,Y), hasAttr_ext(cid(X,_),rid(Z,_),cid(Y,_)), L),
	translation_hasAttr(L).
translation_hasAttr([]).
translation_hasAttr([hasAttr(X,Z,Y)|T]):-
	 write(''''), write(X), write(''''), write('['), write(''''), write(Z), write(''''), write(' *=> '), write(''''), write(Y), write(''''), write('].'),nl,
	translation_hasAttr(T).

translation_isA_ext:- 
	findall( isA_ext(X,Y), isa_ext(oid(X,_),cid(Y,_)), L),
	translation_isA_ext(L).
translation_isA_ext([]).
translation_isA_ext([isA_ext(X,Y)|T]):-
	write(''''), write(X), write(''''), write(' : '),write(''''), write(Y),write(''''), write('.'),nl,
	translation_isA_ext(T).

translation_hasAttr_ext:-
	findall( hasAttr_ext(X,Z,Y), hasAttr_ext(oid(X,_),rid(Z,_),oid(Y,_)), L),
	translation_hasAttr_ext(L).
translation_hasAttr_ext([]).
translation_hasAttr_ext([hasAttr_ext(X,Z,Y)|T]):-
	write(''''), write(X),write(''''), write('['),write(''''), write(Z),write(''''), write(' -> '),write(''''), write(Y),write(''''), write('].'),nl,
	translation_hasAttr_ext(T).
