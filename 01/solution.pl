value('(', 1).
value(')', -1).

main(S) :- readFile("input", R), sum(R, S).

readFile(Path, R) :- open(Path, read, File), read_string(File, _, Str), stringToCharList(Str, Xs), maplist(value, Xs, R).

stringToCharList(String, Characters) :-
    name(String, Xs),
    maplist(toChar, Xs, Characters ).

toChar(X, Y) :- name(Y, [X]).

sum([]   , 0) :- !.
sum([H|T], N) :-
sum(T, N1), N is H+N1.
