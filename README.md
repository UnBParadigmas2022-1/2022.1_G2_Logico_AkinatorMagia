# 2022.1_G2_Logico_AkinatorMagia

# Akinator Magia

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 02<br>
**Paradigma**: Lógico<br>

## Alunos
| Matrícula | Aluno                                                               |
| --------- | ------------------------------------------------------------------- |
| 180119818 | [Felipe Boccardi Silva Agustini](http://github.com/fealps)          |
| 180052845 | [Gabriela da Gama Pivetta](http://github.com/gabrielapivetta)       |
| 180017659 | [Giovana Vitor Dionisio Santana](http://github.com/giovanadionisio) |
| 170011267 | [Giovanna Borges Bottino](http://github.com/giovannabbottino)       |
| 180017870 | [Giulia Lobo Barros](http://github.com/Giuulob89)                   |
| 170144488 | [Henrique Amorim Costa Melo](http://github.com/henriqueamorim20)    |
| 180018574 | [Hérya Rodrigues Alcantara](http://github.com/hryds)                |
| 180025601 | [Murilo Gomes de Souza](http://github.com/murilogds)                |

## Sobre 
Projeto contendo dois jogos: um truque de mágica e um "adivinhador" de estados do Brasil, inspirado no jogo [Akinator](https://pt.akinator.com/). 

## Screenshots
Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação 
**Linguagens**: xxxxxx<br>
**Tecnologias**: xxxxxx<br>
Descreva os pré-requisitos para rodar o seu projeto e os comandos necessários.
Insira um manual ou um script para auxiliar ainda mais.
Gifs animados e outras ilustrações são bem-vindos!

## Uso 
Explique como usar seu projeto.
Procure ilustrar em passos, com apoio de telas do software.

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
| Aluno | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| ----- | ------------ | ------------------------------------------------------------------------------ |
| Felipe |  |  Excelente |
| Gabriela |  | Excelente|
| Giovana | Criação dos fatos e predicados do jogo akinator (_backend_) | Excelente |
| Giovanna |  |  Excelente |
| Giulia |  |  Excelente  |
| Hérya | Criação dos fatos e predicados do jogo akinator (_backend_) |  Excelente  |
| Henrique |  | Excelente |
| Murilo |  |  Excelente  |

## Outros 
### I. Lições Aprendidas
A programação com Prolog trouxe o aprendizado do trabalho com uma linguagem não muito difundida, onde a documentação e dúvidas em fóruns são bem escassas quando comparada, por exemplo, à linguagem utilizada no paradigma anterior (Haskell). Algumas dúvidas que surgiram ao longo da elaboração do projeto não puderam ser sanadas, criando a necessidade de mudança de toda a forma de construção do projeto. Este foi o caso da utlização do predicado "retractall" utilizando uma comparação entre valores: por não conseguirmos utilizar o predicado desta forma, por isso foi necessária a utilização da base com as características descritas em termos de booleanos. 

### II. Percepções
Quanto a elaboração do jogo Akinator, foi percebido que a criação da base de dados demandou mais trabalho do que o planejado. Inicialmente, o jogo foi pensado para a adivinhação de países da América. Entretanto, ao iniciar a elaboração da base de dados, concluiu-se que não seria possível realizar adivinhação dos países, uma vez que estes possuem dados muito semelhantes, principlamente se tratando dos países da América Central. Por esse motivo, mudamos o tema para Estados do Brasil, onde foi possível criar [uma base onde todos os estados possuem dados únicos](https://giovanadionisio.notion.site/04952c57a24d48979a037b0ad6841bfb?v=6dfd01dc2c204e428d8bc859f5b506c3). 


### III. Contribuições e Fragilidades

Quanto as fragilidades, ao jogar o akinator, as primeiras perguntas sempre estão relacionadas à região do estado, o que possibilita a decisão de quais perguntas serão feitas em seguida. No entanto, essa característica torna o jogo um pouco menos dinâmico. 

### IV. Trabalhos Futuros
No jogo akinator, as mesmas perguntas sempre são realizadas, independente da quantidade de fatos ainda restantes na base de dados. Uma verificação da base para a dedução de quais perguntas precisam ser realizadas com base nos fatos restantes é um possível trabalho futuro. 

## Fontes
### Akinator
* Modelo de jogo: https://pt.akinator.com/
* Dados sobre os estados brasileiros: https://pt.wikipedia.org/wiki/Unidades_federativas_do_Brasil
  * Base final de dados elaborada pela equipe: https://giovanadionisio.notion.site/04952c57a24d48979a037b0ad6841bfb?v=6dfd01dc2c204e428d8bc859f5b506c3
* Documentação da Linguagem Prolog: https://www.swi-prolog.org/, para os predicados:
  * forall/2
  * findall/3
  * lenght/2
* Material de Aula da matéria de Paradigmas de Programação:
  * Com destaque para o predicado if-then-else.  
* Dúvidas gerais:
  * "Prolog how to count the number of facts without using a built in": https://stackoverflow.com/questions/59247778/prolog-how-to-count-the-number-of-facts-without-using-a-built-in
  * "how can I print all database facts in prolog": https://stackoverflow.com/questions/8510701/how-can-i-print-all-database-facts-in-prolog
