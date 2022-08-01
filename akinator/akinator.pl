:- initialization(akinator).
:- style_check(-singleton).
:- use_module(library(lists)).
:- use_module(library(pce)).

akinator :- consult('akinator/base.pl'),
    new(W, dialog('Menu')),
	send(W, size, size(900, 500)),
    send(W, background, '#7D97D9'),
    send(W, open),
    perguntaRegiao(W).


mostra_pergunta(W) :-
    nb_getval(pergunta, Pergunta),
    new(T, text(Pergunta)),
    new(F, font(screen, bold, 25)),
    send(T, font(F)),
    send(T, colour('#D9CF68')),
    send(W, gap, size(200, 70)),
    send(W, append, T),
    send(W, append, new(BTS, dialog_group(buttons, group))),
    send(BTS, append, new(B1, fixed_size_button('não', message(@prolog, setResposta, 1))), below),
    send(BTS, append, new(B2, fixed_size_button('sim', message(@prolog, setResposta, 2))), right),
    send_list([B1,B2], size(size(250,40))),
    send(BTS, layout_dialog),
    send(W, layout),
    !.

setResposta(Resposta) :-
    write(Resposta) !.

perguntaRegiao(W) :-
    nb_setval(pergunta, 'Seu estado é da região Norte?'),
    mostra_pergunta(W), !.

perguntaRegiao :- write("Seu estado é da região Nordeste?"),
                  read(R),
                  (resposta(sim, R) ->
                    perguntasNordeste,
                    !
                  ).
perguntaRegiao :- write("Seu estado é da região Centro Oeste?"),
                  read(R),
                  (resposta(sim, R) ->
                    perguntasCentroOeste,
                    !
                  ).
perguntaRegiao :- write("Seu estado é da região Sudeste?"),
                  read(R),
                  (resposta(sim, R) ->
                    perguntasSudeste,
                    !
                  ).
perguntaRegiao :- write("Seu estado é da região Sul?"),
                  read(R),
                  (resposta(sim, R) ->
                    perguntasSul,
                    !
                  ).
perguntaRegiao :- anunciaResultado.

ifThenElse(X, Y, _) :- X, !, Y.
ifThenElse(_, _, Z) :- Z.

anunciaResultado :- 
    findall(1, estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), List),
    length(List, Count),
    Count == 1,
    write("Seu estado eh:"), nl,
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))).
anunciaResultado :-
    write("Não foi possível encontrar o seu estado. Tem certeza que ele faz parte do Brasil? ;)"), nl.

% estado (estado, [regiao, numeroHabitantes, acessoAoLitoral, divisaOutraRegiao, densidadePopulacional, numeroDivisas, indiceAlfabetizacao, nome])
perguntasNorte :- 
    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
    
    write("Seu estado tem acesso ao mar?"),
    read(X),
    ifThenElse(resposta(sim,X),
    retractall(estado(_, _, no, _, _, _, _, _, _, _)),
    retractall(estado(_, _, yes, _, _, _, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("Seu estado tem mais de 5 milhões de habitantes?"),
    read(Y),
    ifThenElse(resposta(sim,Y),
    retractall(estado(_, _, _, _, _, _, _, no, _, _)),
    retractall(estado(_, _, _, _, _, _, _, yes, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
    
    write("A densidade populacional do seu estado é menor que 4?"),
    read(Z),
    ifThenElse(resposta(sim,Z),
    retractall(estado(_, _, _, _, no, _, _, _, _, _)),
    retractall(estado(_, _, _, _, yes, _, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("O seu estado faz divisa com outras regiões?"),
    read(W),
    ifThenElse(resposta(sim,W),
    retractall(estado(_, _, _, no, _, _, _, _, _, _)),
    retractall(estado(_, _, _, yes, _, _, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
    
    write("O seu estado faz divisa com mais de três estados?"),
    read(U),
    ifThenElse(resposta(sim,U),
    retractall(estado(_, _, _, _, _, _, no, _, _, _)),
    retractall(estado(_, _, _, _, _, _, yes, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    anunciaResultado.

perguntasNordeste :-
% +5M de habitantes, Alfabetização < 85%, densidadePopulacional entre 50 e 100, divisa com + de 3 estados, 
% divisaOutraRegiao, nomeComposto 
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
    
    write("Seu estado tem mais de 5 milhões de habitantes?"),
    read(X),
    ifThenElse(resposta(sim,X),
    retractall(estado(_, _, _, _, _, _, _, no, _, _)),
    retractall(estado(_, _, _, _, _, _, _, yes, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
    
    write("O índice de alfabetização do seu estado é menor que 85%?"),
    read(Y),
    ifThenElse(resposta(sim,Y),
    retractall(estado(_, _, _, _, _, _, _, _, no, _)),
    retractall(estado(_, _, _, _, _, _, _, _, yes, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("A densidade populacional do seu estado está entre 50 e 100?"),
    read(Z),
    ifThenElse(resposta(sim,Z),
    retractall(estado(_, _, _, _, _, no, _, _, _, _)),
    retractall(estado(_, _, _, _, _, yes, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("O seu estado faz divisa com mais de três estados?"),
    read(W),
    ifThenElse(resposta(sim,W),
    retractall(estado(_, _, _, _, _, _, no, _, _, _)),
    retractall(estado(_, _, _, _, _, _, yes, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("O seu estado faz divisa com outras regiões?"),
    read(U),
    ifThenElse(resposta(sim,U),
    retractall(estado(_, _, _, no, _, _, _, _, _, _)),
    retractall(estado(_, _, _, yes, _, _, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("O nome do seu estado é composto?"),
    read(V),
    ifThenElse(resposta(sim,V),
    retractall(estado(_, _, _, _, _, _, _, _, _, no)),
    retractall(estado(_, _, _, _, _, _, _, _, _, yes))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
    
    anunciaResultado.

perguntasCentroOeste :- write("É do centro oeste!"),
% +5M de habitantes, densidadePopulacional, Divisa com + de 3 estados

    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("Seu estado tem mais de 5 milhões de habitantes?"),
    read(X),
    ifThenElse(resposta(sim,X),
    retractall(estado(_, _, _, _, _, _, _, no, _, _)),
    retractall(estado(_, _, _, _, _, _, _, yes, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("A densidade populacional do seu estado é menor que 4?"),
    read(Y),
    ifThenElse(resposta(sim,Y),
    retractall(estado(_, _, _, _, no, _, _, _, _, _)),
    retractall(estado(_, _, _, _, yes, _, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("O seu estado faz divisa com mais de três estados?"),
    read(Z),
    ifThenElse(resposta(sim,Z),
    retractall(estado(_, _, _, _, _, _, no, _, _, _)),
    retractall(estado(_, _, _, _, _, _, yes, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    anunciaResultado.
  

perguntasSudeste :- 
% litoral, +5 mi de habitantes, divisa com +3 estados
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("Seu estado tem acesso ao mar?"),
    read(X),
    ifThenElse(resposta(sim,X),
    retractall(estado(_, _, no, _, _, _, _, _, _, _)),
    retractall(estado(_, _, yes, _, _, _, _, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("Seu estado tem mais de 5 milhões de habitantes?"),
    read(Y),
    ifThenElse(resposta(sim,Y),
    retractall(estado(_, _, _, _, _, _, _, no, _, _)),
    retractall(estado(_, _, _, _, _, _, _, yes, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    write("O seu estado faz divisa com mais de três estados?"),
    read(Z),
    ifThenElse(resposta(sim,Z),
    retractall(estado(_, _, _, _, _, _, no, _, _, _)),
    retractall(estado(_, _, _, _, _, _, yes, _, _, _))
    ),
    forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

    anunciaResultado.

perguntasSul :- write("É do sul!"),
% densidadePopulacional entra 50 e 100, divisa com outras regioes, nome composto

  retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
  retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
  retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
  retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
  forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

  write("A densidade populacional do seu estado está entre 50 e 100?"),
  read(X),
  ifThenElse(resposta(sim,X),
  retractall(estado(_, _, _, _, _, no, _, _, _, _)),
  retractall(estado(_, _, _, _, _, yes, _, _, _, _))
  ),
  forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

  write("O seu estado faz divisa com outras regiões?"),
  read(Y),
  ifThenElse(resposta(sim,Y),
  retractall(estado(_, _, _, no, _, _, _, _, _, _)),
  retractall(estado(_, _, _, yes, _, _, _, _, _, _))
  ),
  forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),

  write("O nome do seu estado é composto?"),
  read(Z),
  ifThenElse(resposta(sim,Z),
  retractall(estado(_, _, _, _, _, _, _, _, _, no)),
  retractall(estado(_, _, _, _, _, _, _, _, _, yes))
  ),
  forall(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), writeln(estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC))),
  
  anunciaResultado.

resposta(nao, n).
resposta(sim, s).