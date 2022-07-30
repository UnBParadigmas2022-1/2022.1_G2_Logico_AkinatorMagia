:- initialization(akinator).
:- [base].

akinator :- write('Teste'),
            findall(estado(Estado, Dados), estado(Estado, Dados), Estados),
            perguntaRegiao.
            %print_list(Estados).

print_list([]):-nl. %nl = newline
print_list([H|T]):-write(H),write(' '),print_list(T).

perguntaRegiao :- write("Seu estado é da região Norte?"),
                  read(R),
                  (resposta(sim, R) ->
                    perguntasNorte,
                    !
                  ).
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

perguntasNorte :- write("É do norte!").
perguntasNordeste :- write("É do nordeste!").
perguntasCentroOeste :- write("É do centro oeste!").
perguntasSudeste :- write("É do sudeste!").
perguntasSul :- write("É do sul!").

resposta(nao, n).
resposta(sim, s).