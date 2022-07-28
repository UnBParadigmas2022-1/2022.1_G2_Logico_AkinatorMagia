:- initialization(menu).
:- use_module(library(pce)).

:- pce_begin_class(fixed_size_button, button).

compute(_) :-> true.

:- pce_end_class.

menu:-  repeat,
	new(W, dialog('Menu')),
	send(W, size, size(1000, 800)),
	new(T, text('Escolha seu jogo')),
	new(F, font(screen, bold, 35)),
	send(T, font(F)),
	send(W, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, gap, size(0, 30)),
	send(BTS, append, T),
	send(BTS, append, new(B1, fixed_size_button('Truque de mágica', message(@prolog, option, 1))), below),
	send(BTS, append, new(B2, fixed_size_button('Akinator', message(@prolog, option, 2))), below),
	send(BTS, append, new(B3, fixed_size_button('Sair', message(W, destroy))), below),
	send_list([B1,B2,B3], size(size(320,50))),
	% send(BTS, alignment(center)),
	send(BTS, layout_dialog),
    send(W, open),
	!.

option(0):- !.
option(1):- write('Abrindo truque de mágica...'), nl,
    consult(truque/magica), !.
option(2):- write('Abrindo akinator...'), nl, !.
option(_):- write('Não é uma opção válida'), nl, !.
