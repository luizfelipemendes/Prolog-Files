:- dynamic %Usado para a função known (armazenar uma informacao dada pelo usuário)
	known/3. 

:- discontiguous %Usado para eliminar a mensagem informada ao carregar o programa
  estacao/1.

bird:- % Inicializacao do programa
  retractall(known(_,_,_)), % Reseta a função known, ou seja, todas as informações dadas pelo usuário anteriormente são apagadas
  passaro(X), 
  write('O passaro eh um(a) '),write(X),nl.

bird:-
  write('O passaro procurado nao esta em nossa base de dados'), nl.

% Aves da ordem Procellariiformes possuem narinas externas tubulares, vivem no mar e possuem bico em formato de anzol.
ordem(procellariiformes) :- narinas(externas_tubulares), vive(mar), bico(anzol).

% Aves da ordem Anseriformes possuem bico reto e patas com membrana.
ordem(anseriformes) :- bico(reto), patas(membrana).

% É formada por aves da ordem Procellariiformes, são de grande porte e possuem asas alongadas
familia(diomedeidae) :- ordem(procellariiformes), tamanho(grande), asas(alongadas).

% É formada por aves da ordem Anseriformes, que possuem pescoço longo, cor branca e voam lentamente.
familia(anatidae) :- ordem(anseriformes), pescoco(longo), cor(branco), velocidade_voo(lento).

% O Albatroz Laysan é da família Diomedeidae e tem cor branca
passaro(albatroz_laysan) :- familia(diomedeidae), cor(branco).

% O Albatroz Laysan é da família Diomedeidae e tem cor escura
passaro(albatroz_patinegro):- familia(diomedeidae), cor(preto).

% O cisne pequeno é da família Anatidae e produz um canto alto, semelhante a uma trombeta
passaro(cisne_pequeno) :- familia(anatidae), canto(abafado).

% O cisne pequeno é da família Anatidae e produz um canto abafado
passaro(cisne_trombeteiro) :- familia(anatidae), canto(alto_trombeta).

% O ganso do Canadá é uma ave migratória, que é vista no verão no Canadá, mas no inverno é vista nos EUA. A ave possui a cabeça preta bochechas brancas e pertence à família Anatidae.
passaro(ganso_do_canada) :- familia(anatidae), bochecha(branco), local_avistado(estados_unidos), estacao(inverno).

% Pergunta ao usuário os valores para as premissas 
cor(X):- ask(cor, X).
canto(X):- ask(canto, X).
estacao(X):- ask(estacao, X).
cabeca(X):- ask(cabeca, X).
bochecha(X):- ask(bochecha, X).
tamanho(X):- ask(tamanho, X).
asas(X):- ask(asas, X).
narinas(X):- ask(narinas, X).
vive(X):- ask(vive, X).
bico(X):- ask(bico, X).
pescoco(X):- ask(pescoco, X).
velocidade_voo(X):- ask(velocidade_voo, X).
patas(X):- ask(patas, X).
local_avistado(X):- ask(local_avistado, X).
estacao(X):- ask(estacao, X).

% Verifica com o usuário se o atributo perguntado é verdadeiro ou falso, sempre armazenando uma determinada informação, csaso a pergunta seja repetida.
ask(A, V):-
known(sim, A, V), 
!.	

ask(A, V):-
known(_, A, V),
!, fail.

ask(A, V):-
write(A:V), 
write('? : '), 
read(Y), 
asserta(known(Y, A, V)), 
Y == sim.