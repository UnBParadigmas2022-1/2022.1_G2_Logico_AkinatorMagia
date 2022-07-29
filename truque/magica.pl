:- initialization(cria_tela).
:- style_check(-singleton).
:- use_module(library(lists)).
:- use_module(library(random)).
:- dynamic game/2.
:- use_module(library(pce)).

magica(X, [H|T]) :-
    member(X, H),
    magica(X, T).
magica(X, []).

table(W, I, [H|T]) :- 
    format(atom(S), '~w', (I=H)),
    new(F1, font(screen, roman, 15)),
    new(T1, text(S)),
	send(T1, font(F1)),
    send(W, append, T1),
    R is I+1,
    table(W, R, T).
table(_, _, []).

play(W) :- 
    writeln("Vou advinhar sua carta!"),
    game(W, ['K♠', 'Q♣', 'J♦', 'A♥', '2♠', '3♣', '4♦', '5♥', '6♠', '7♣', '8♦', '9♥'], []), !.

verifica(Escolha) :- 
    length(Escolha, LE), LE > 1,
    findall(X, magica(X, Escolha), L),
    length(L, N), N == 1,
    magica(Z, Escolha),
    write('Sua carta é a '), write(Z), write('!'), nl.

cria_tela :-
    new(W, dialog('Menu')),
    
	send(W, size, size(1000, 800)),
    send(W, open),
    play(W).

game(W, Baralho, Escolhas) :- repeat,
	new(T, text('Escolha uma carta e fale em qual conjunto ela está')),
	new(F, font(screen, bold, 15)),
	send(T, font(F)),
    separa(Baralho, Baralhos),
    nb_setval(baralhos, Baralhos),
    nb_setval(escolhas, Escolhas),
    send(W, append, T),
    table(W, 1, Baralhos),
	
	send(W, append, new(B1, fixed_size_button('Deque 1',
        message(@prolog, escolhe, W, 1))), below),
	send(W, append, new(B2, fixed_size_button('Deque 2',
        message(@prolog, escolhe, W, 2))), right),
    send_list([B1,B2], size(size(220,30))),
    send(W, layout),

    !.

separa(Baralho, Baralhos) :- 
    random_permutation(Baralho, Embaralhado),
    append(A, B, Embaralhado),
    length(A, N),
    length(B, N),
    Baralhos = [A,B].


escolhe(W, Escolha) :-
    nb_getval(baralhos, Baralhos),
    nb_getval(escolhas, Escolhas),

    send(W, clear),
    
    Index is Escolha-1, % equivale ao index da lista
    nth0(Index, Baralhos, Deque),
    append([Deque], Escolhas, NovasEscolhas),
    (
        verifica(NovasEscolhas); % verifica se ele já sabe a carta
        game(W, ['K♠', 'Q♣', 'J♦', 'A♥', '2♠', '3♣', '4♦', '5♥', '6♠', '7♣', '8♦', '9♥'], NovasEscolhas)
    );
    !.
