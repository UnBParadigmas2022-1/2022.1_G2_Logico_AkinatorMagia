:- initialization(menu).

menu:-  repeat,
	write('=== MENU ==='), nl,
	write('1. Truque de magica'), nl,
	write('2. Akinator'), nl,
	write('0. Sair'), nl,
	read(X),
	option(X),
	X==0,
	!.

option(0):- !.
option(1):- write('Abrindo truque de mágica...'), nl, !.
option(2):- write('Abrindo akinator...'), nl, 
   consult(akinator/akinator), !.
option(_):- write('Não é uma opção válida'), nl, !.
