extends Node

# Variáveis globais
var full_text: String = "SHARIMAR"
var current_index: int = 0

@onready var label: Label = $Label
@onready var typing_timer: Timer = $TypingTimer

func _ready():
	# Iniciar o Timer
	typing_timer.connect("timeout", Callable(self, "_on_TypingTimer_timeout"))
	typing_timer.start(0.1)  # Intervalo de tempo em segundos (ajuste conforme necessário)
	label.text = ""

func _on_TypingTimer_timeout():
	if current_index < full_text.length():
		# Adicionar a próxima letra ao Label
		label.text += full_text[current_index]
		current_index += 1
	else:
		# Parar o Timer quando todo o texto tiver sido mostrado
		typing_timer.stop()
