:- initialization(menu).
:- use_module(library(pce)).

menu:-  repeat,
	new(W, window('Menu')),
	send(W, size, size(500, 600)),
	new(T,text('Escolha seu jogo')),
	send(W, display, T, point(200, 200)),
	send(W, display, button('Truque de mágica', message(@prolog, option, 1)), point(193,300)),
	send(W, display, button('Akinator', message(@prolog, option, 2)), point(215,350)),
    send(W, open),
	!.

option(0):- !.
option(1):- write('Abrindo truque de mágica...'), nl,
    consult(truque/magica), !.
option(2):- write('Abrindo akinator...'), nl, !.
option(_):- write('Não é uma opção válida'), nl, !.
