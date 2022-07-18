% use_module(library(lists))

membro(X, [X|_]).
membro(X, [_|T]) :- membro(X,T).

escolha(X, [H|T]) :-
    write(H), nl,
    membro(X, H),
    escolha(X, T), !.
escolha(X, []).

% [k, q, j, a, 2, 3, 4, 5, 6]
% [[k, q, j], [q, j, a], [k, a, q]]
