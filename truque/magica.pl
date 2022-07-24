:- initialization(play).
:- style_check(-singleton).
:- use_module(library(lists)).
:- use_module(library(random)).
:- dynamic game/2.

magica(X, [H|T]) :-
    member(X, H),
    magica(X, T).
magica(X, []).

table(I, [H|T]) :- 
    write(I = H), nl,
    R is I+1,
    table(R, T).
table(_, []).

play :- 
    writeln("Vou advinhar sua carta!"), nl,
    game(['K♠', 'Q♣', 'J♦', 'A♥', '2♠', '3♣', '4♦', '5♥', '6♠', '7♣', '8♦', '9♥'], []), !.

verifica(Escolha) :- 
    length(Escolha, LE), LE > 1,
    findall(X, magica(X, Escolha), L),
    length(L, N), N == 1,
    magica(Z, Escolha),
    write('Sua carta é a '), write(Z), write('!'), nl.

game(Baralho, Escolhas) :- 
    writeln("Escolha uma carta e fale em qual conjunto de deque ela está"), nl,
    separa(Baralho, Baralhos),
    table(0, Baralhos),
    read(Escolha), 
    nth0(Escolha, Baralhos, Deque),
    append([Deque], Escolhas, NovasEscolhas),

    (verifica(NovasEscolhas);
    game(Baralho, NovasEscolhas)).

separa(Baralho, Baralhos) :- 
    random_permutation(Baralho, Embaralhado),
    append(A, B, Embaralhado),
    length(A, N),
    length(B, N),
    Baralhos = [A,B].
