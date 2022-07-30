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
    format(atom(S), '                    ~w', (I=H)),
    new(F1, font(screen, roman, 20)),
    new(T1, text(S)),
	send(T1, font(F1)),
    send(T1,colour('#F5F5F5')),
    send(W, append, T1),
    R is I+1,
    table(W, R, T).
table(_, _, []).

play(W) :- 
    game(W, ['K♠', 'Q♣', 'J♦', 'A♥', '2♠', '3♣', '4♦', '5♥', '6♠', '7♣', '8♦', '9♥'], []), !.

verifica(Escolha, W) :- 
    length(Escolha, LE), LE > 1,
    findall(X, magica(X, Escolha), L),
    length(L, N), N == 1,
    magica(Z, Escolha),
    finaliza_jogo(W, Z).

cria_tela :-
    new(W, dialog('Menu')),
    
	send(W, size, size(900, 500)),
    send(W, open),
    play(W).

game(W, Baralho, Escolhas) :- repeat,
	new(T, text('Escolha uma carta e fale em qual conjunto ela está')),
	new(F, font(screen, bold, 25)),
	send(T, font(F)),
    send(T, colour('#cd081c')),
    separa(Baralho, Baralhos),
    nb_setval(baralhos, Baralhos),
    nb_setval(escolhas, Escolhas),
    send(W, gap, size(90, 70)),
    send(W, append, T),
    send(W, append, new(DG1, dialog_group(buttons, group)), below),
    send(DG1, gap, size(0, 60)),
    table(DG1, 1, Baralhos),
    send(DG1, layout_dialog),
    send(W, append, new(DG2, dialog_group(buttons, group)), below),
    send(DG2, gap, size(230, 30)),
    send(DG2, append, text('')),
	send(DG2, append, new(B1, fixed_size_button('Deque 1',
        message(@prolog, escolhe, W, 1))), below),
	send(DG2, append, new(B2, fixed_size_button('Deque 2',
        message(@prolog, escolhe, W, 2))), right),
    send_list([B1,B2], size(size(250,40))),
    send(DG2, layout_dialog),
    send(W, layout),
    send(W, background, '#3d5047'),
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
        verifica(NovasEscolhas, W); % verifica se ele já sabe a carta
        game(W, ['K♠', 'Q♣', 'J♦', 'A♥', '2♠', '3♣', '4♦', '5♥', '6♠', '7♣', '8♦', '9♥'], NovasEscolhas)
    );
    !.

finaliza_jogo(W, Carta) :-
    format(atom(S), 'Sua carta é a ~w!', Carta),
    new(SI, text(S)),
    new(TI, text('Fim do Jogo!')),
	new(FI, font(screen, bold, 35)),
	send(TI, font(FI)),
    send(SI, font(FI)),
    send(TI,colour('#cd081c')),
    send(SI,colour('#cd081c')),
    send(W, append(TI)),
    send(W, append, SI, below),
    send(W, gap, size(100, 30)),
    send(W, append, new(B3, fixed_size_button('Sair', message(W, destroy))), below),
    send(B3, size(size(350,40))),
    send(W, layout).