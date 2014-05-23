?- [main_classes].

translation_mc:- 
	tell('main_classes.txt'),
	translation_isA, nl,
	translation_hasAttr_ext, nl,
	translation_maxAttr_ext, nl,
	told.
	
translation_isA:-
	findall( isA(X,Y), isa_ext(cid(X,_),cid(Y,_)), L),
	translation_isA(L).
translation_isA([]).
translation_isA([isA(X,Y)|T]):-
	 write(''''), write(X), write(''''), write(' :: '), write(''''), write(Y), write(''''), write('.'),nl,
	translation_isA(T).

translation_hasAttr_ext:-
	findall( hasAttr_ext(X,Z,Y), hasAttr_ext(cid(X,_),rid(Z,_),cid(Y,_)), L),
	translation_hasAttr_ext(L).
translation_hasAttr_ext([]).
translation_hasAttr_ext([hasAttr_ext(X,Z,Y)|T]):-
	 write(''''), write(X), write(''''), write('['), write(''''), write(Z), write(''''), write(' *=> '), write(''''), write(Y), write(''''), write('].'),nl,
	translation_hasAttr_ext(T).

translation_maxAttr_ext:-
	findall( maxAttr_ext(X,Z,Y,N), maxAttr_ext(cid(X,_),rid(Z,_),cid(Y,_),N), L),
	translation_maxAttr_ext(L).
translation_maxAttr_ext([]).
translation_maxAttr_ext([maxAttr_ext(X,Z,Y,N)|T]):-
	 write(''''), write(X), write(''''), write('['), write(''''), write(Z), write(''''), write(' {1 : '), write(N), write('} *=> '),  write(''''), write(Y), write(''''), write(' ]. '), nl,
	translation_maxAttr_ext(T).
