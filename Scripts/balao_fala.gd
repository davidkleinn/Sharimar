extends Node2D

class_name Balao

@onready var balao_resposta_1 = $Control/BalaoResposta1
@onready var balao_resposta_2 = $Control/BalaoResposta2

var strList = ["Eu venho depois de 'Monday' e antes 
de 'Wednesday'. Quem sou eu?",
"Sou o primeiro mês do ano, o
 mês da volta às aulas. Quem sou eu?",
"Sou o mês que trás o Natal à 
todos, o último do ano. Quem sou eu?",
"Quando alguém fala algo muito 
engraçado, o que você faz?",
"Quando alguém me apaga, geralmente 
fazem um desejo. Quem sou eu?",
"Quando você está muito animado, 
você mostra isso com o que em seu rosto?",
"Eu me senti muito _ vendo 
vocês me deixando de lado",
"O que você dá aos amigos 
em uma festa de aniversário?",
"O que você sente quando alguém 
lhe dá um presente de surpresa?",
"O que você sente quando 
você perde um jogo?",
"Qual é o último 
dia da semana?",
"Qual é o mês que 
vem depois de abril?",
"Qual mês tem o 
Dia das Bruxas?",
"Em qual dia da semana 
muitas crianças não têm escola?"]
var respList1 = ["Tuesday",
"July",
"August",
"Laugh",
"Light",
"Cry",
"Sad",
"Homework",
"Happy",
"Happy",
"Saturday",
"December",
"August",
"Saturday"]
var respList2 = ["Friday",
"January",
"December",
"Cry",
"Candle",
"Smile",
"Happy",
"Presents",
"Angry",
"Sad",
"Monday",
"May",
"October",
"Wednesday"]

var respCerta = ["Tuesday",
"January",
"December",
"Laugh",
"Candle",
"Smile",
"Sad",
"Presents",
"Happy",
"Sad",
"Saturday",
"May",
"October",
"Saturday"]

var available_indices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13]  # Lista de índices disponíveis


@onready var charada_1 = $Control/Charada1
@onready var resposta_1 = $Control/Resposta1
@onready var resposta_2 = $Control/Resposta2
@onready var resposta_3 = $Control/Resposta3

func _ready():
	randomize_question()

# Função para gerar uma pergunta aleatória que não se repita na fase
func randomize_question():
	if available_indices.size() == 0:
		print("Todas as perguntas foram usadas!")
		return

	var rng = RandomNumberGenerator.new()
	rng.randomize()

	# Selecionar um índice aleatório dos disponíveis
	
	var random_index = -1
	var ix = -1

	# Garantir que o índice selecionado não está na lista de usados
	while true:
		random_index = rng.randi_range(0, available_indices.size() - 1)
		ix = available_indices[random_index]
		if not Global.used_indices.has(ix):
			Global.indices_contador += 1
			Global.used_indices.append(ix)
			available_indices.remove_at(random_index)
			break

	# Remover o índice selecionado da lista de índices disponíveis e adicionar à lista de usados
	
	
	print("Available indices: ", available_indices)
	print("Used indices: ", Global.used_indices)

	# Atualizar os textos com base no índice selecionado
	var randomStr = strList[ix]
	var randomRespList1 = respList1[ix]
	var randomRespList2 = respList2[ix]
	var randomRespCerta = respCerta[ix]

	charada_1.text = randomStr
	resposta_1.text = randomRespList1
	resposta_2.text = randomRespList2
	resposta_3.text = randomRespCerta

# Função para reiniciar o jogo e restaurar as perguntas
func restart_game():
	available_indices = [0, 1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12,13]  # Restaurar todos os índices disponíveis
	Global.used_indices.clear()  # Limpar a lista de usados
	randomize_question()

# Função para avançar para a próxima fase
func next_phase():
	randomize_question()

func _process(delta):
	Global.balaoresp1 = balao_resposta_1.global_position
	Global.balaoresp2 = balao_resposta_2.global_position
	Global.resp1 = resposta_1.text
	Global.resp2 = resposta_2.text
	Global.resp_certa = resposta_3.text
