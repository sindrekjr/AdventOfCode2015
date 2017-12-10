value('(', 1).
value(')', -1).

part1(S) :- readFile("input", R), sum(R, S), !.
part2(I) :- readFile("input", R), addAndIndex(R, I), !.

readFile(Path, R) :- open(Path, read, File), read_string(File, _, Str), stringToCharList(Str, Xs), maplist(value, Xs, R).

stringToCharList(String, Characters) :- name(String, Xs), maplist(toChar, Xs, Characters ).
toChar(X, Y) :- name(Y, [X]).

addAndIndex([H|T], Index) :- addAndIndex(T, H, 1, Index).

addAndIndex(_, (-1), FIndex, FIndex).
addAndIndex([H|T], S, CIndex, Index) :-
  Sum is S + H, NIndex is CIndex + 1,
  addAndIndex(T, Sum, NIndex, Index).

sum([], 0) :- !.
sum([H|T], S) :- sum(T, CNum), S is H + CNum.
