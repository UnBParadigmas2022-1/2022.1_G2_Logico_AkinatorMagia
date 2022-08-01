:- initialization(iniciaTela).
:- style_check(-singleton).
:- use_module(library(lists)).
:- use_module(library(pce)).
iniciaTela :- consult('akinator/base.pl'),
    new(W, dialog('Menu')),
    send(W, size, size(900, 500)),
    send(W, background, '#7D97D9'),
    send(W, open),
    iniciaJogo(W).
iniciaJogo(W) :-
    perguntaRegiaoNorte(W), !.
perguntaRegiaoNorte(W) :-
    nb_setval(pergunta, 'Seu estado é da região Norte?'),
    mostra_pergunta(W), !.
perguntaRegiaoNordeste(W) :-
    nb_setval(pergunta, 'Seu estado é da região Nordeste?'),
    mostra_pergunta(W), !.
perguntaRegiaoCentroOeste(W) :-
    nb_setval(pergunta, 'Seu estado é da região Centro Oeste?'),
    mostra_pergunta(W), !.
perguntaRegiaoSudeste(W) :-
    nb_setval(pergunta, 'Seu estado é da região Sudeste?'),
    mostra_pergunta(W), !.
perguntaRegiaoSul(W) :-
    nb_setval(pergunta, 'Seu estado é da região Sul?'),
    mostra_pergunta(W), !.
perguntaMar(W) :-
    nb_setval(pergunta, 'Seu estado tem acesso ao mar?'),
    mostra_pergunta(W), !.
perguntaHabitantes(W) :-
    nb_setval(pergunta, 'Seu estado tem mais de 5 milhões de habitantes?'),
    mostra_pergunta(W), !.
perguntaDensidade(W) :-
    nb_setval(pergunta, 'A densidade populacional do seu estado é menor que 4?'),
    mostra_pergunta(W), !.
perguntaDivisaRegiao(W) :-
    nb_setval(pergunta, 'O seu estado faz divisa com outras regiões?'),
    mostra_pergunta(W), !.
perguntaDivisaEstado(W) :-
    nb_setval(pergunta, 'O seu estado faz divisa com mais de três estados?'),
    mostra_pergunta(W), !.
perguntaAlfabetizacao(W) :-
    nb_setval(pergunta, 'O índice de alfabetização do seu estado é menor que 85%?'),
    mostra_pergunta(W), !.
perguntaDensidadePopulacional(W) :-
    nb_setval(pergunta, 'A densidade populacional do seu estado está entre 50 e 100?'),
    mostra_pergunta(W), !.
perguntaNome(W) :-
    nb_setval(pergunta, 'O nome do seu estado é composto?'),
    mostra_pergunta(W), !.
mostra_pergunta(W) :-
    send(W, clear),
    nb_getval(pergunta, Pergunta),
    new(T, text(Pergunta)),
    new(F, font(screen, bold, 25)),
    send(T, font(F)),
    send(T, colour('#D9CF68')),
    send(W, gap, size(200, 70)),
    send(W, append, T),
    send(W, append, new(BTS, dialog_group(buttons, group))),
    send(BTS, append, new(B1, fixed_size_button('não', message(@prolog, handleResposta, W, 1, Pergunta))), below),
    send(BTS, append, new(B2, fixed_size_button('sim', message(@prolog, handleResposta, W, 2, Pergunta))), right),
    send_list([B1,B2], size(size(250,40))),
    send(BTS, layout_dialog),
    send(W, layout),
    !.
handleResposta(W, Resposta, Pergunta) :-
    write("Resposta: "),
    write(Resposta), nl,
    write("Pergunta: "),
    write(Pergunta), nl,
    (Pergunta = 'Seu estado é da região Norte?' ->
       (Resposta = 2 -> estadoNorte(W) ; perguntaRegiaoNordeste(W))
    );
    (Pergunta = 'Seu estado é da região Nordeste?' ->
        (Resposta = 2 -> estadoNordeste(W) ; perguntaRegiaoCentroOeste(W))
    );
    (Pergunta = 'Seu estado é da região Centro Oeste?' ->
        (Resposta = 2 -> estadoCentroOeste(W) ; perguntaRegiaoSudeste(W))
    );
    (Pergunta = 'Seu estado é da região Sudeste?' ->
        (Resposta = 2 -> estadoSudeste(W) ; perguntaRegiaoSul(W))
    );
    (Pergunta = 'Seu estado é da região Sul?' ->
        (Resposta = 2 -> estadoSul(W) ; anunciaResultado(W))
    );
    (Pergunta = 'Seu estado tem acesso ao mar?' ->
        (Resposta = 2 -> possuiMar(W, yes) ; possuiMar(W, no))
    );
    (Pergunta = 'Seu estado tem mais de 5 milhões de habitantes?' ->
        (Resposta = 2 -> possuiHabitantes(W, yes) ; possuiHabitantes(W, no))
    );
    (Pergunta = 'A densidade populacional do seu estado é menor que 4?' ->
        (Resposta = 2 -> possuiDensidade(W, yes) ; possuiDensidade(W, no))
    );
    (Pergunta = 'O seu estado faz divisa com outras regiões?' ->
        (Resposta = 2 -> possuiDivisaRegiao(W, yes) ; possuiDivisaRegiao(W, no))
    );
    (Pergunta = 'O seu estado faz divisa com mais de três estados?' ->
        (Resposta = 2 -> possuiDivisaEstado(W, yes) ; possuiDivisaEstado(W, no))
    );
    (Pergunta = 'O índice de alfabetização do seu estado é menor que 85%?' ->
        (Resposta = 2 -> possuiAlfabetizacao(W, yes) ; possuiAlfabetizacao(W, no))
    );
    (Pergunta = 'A densidade populacional do seu estado está entre 50 e 100?' ->
        (Resposta = 2 -> possuiDensidadePopulacional(W, yes) ; possuiDensidadePopulacional(W, no))
    );
    (Pergunta = 'O nome do seu estado é composto?' ->
        (Resposta = 2 -> possuiNome(W, yes) ; possuiNome(W, no))
    );
    !.

estadoNorte(W) :-
    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    perguntaMar(W),
    !.
estadoNordeste(W) :-
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    perguntaMar(W),
    !.
estadoCentroOeste(W) :-
    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    perguntaMar(W),
    !.
estadoSudeste(W) :-
    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sul, _, _, _, _, _, _, _, _)),
    perguntaMar(W),
    !.
estadoSul(W) :-
    retractall(estado(_, nordeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, centroOeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, sudeste, _, _, _, _, _, _, _, _)),
    retractall(estado(_, norte, _, _, _, _, _, _, _, _)),
    perguntaMar(W),
    !.
possuiMar(W, Resposta) :-
    retractall(estado(_, _, Resposta, _, _, _, _, _, _, _)),
    perguntaHabitantes(W), !.
possuiHabitantes(W, Resposta) :-
    retractall(estado(_, _, _, _, _, _, _, Resposta, _, _)),
    perguntaDensidade(W), !.
possuiDensidade(W, Resposta) :-
    retractall(estado(_, _, _, _, Resposta, _, _, _, _, _)),
    perguntaDivisaRegiao(W), !.
possuiDivisaRegiao(W, Resposta) :-
    retractall(estado(_, _, _, Resposta, _, _, _, _, _, _)),
    perguntaDivisaEstado(W), !.
possuiDivisaEstado(W, Resposta) :-
    retractall(estado(_, _, _, _, _, _, Resposta, _, _, _)),
    perguntaAlfabetizacao(W), !.
possuiAlfabetizacao(W, Resposta) :-
    retractall(estado(_, _, _, _, _, _, _, _, Resposta, _)),
    perguntaDensidadePopulacional(W), !.
possuiDensidadePopulacional(W, Resposta) :-
    retractall(estado(_, _, _, _, _, Resposta, _, _, _, _)),
    perguntaNome(W), !.
possuiNome(W, Resposta) :-
    retractall(estado(_, _, _, _, _, _, _, _, _, Resposta)),
    anunciaResultado(W), !.
anunciaResultado(W) :-
    write('aqui'), nl,
    findall(D, estado(N,R,L,DOR,DP4,DP5e10,DE,MH,A,NC), List),
    length(List, Count),
    write(D), nl,
    !.