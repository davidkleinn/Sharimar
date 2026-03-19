extends Node

@onready var play_button: Button = $PlayButton
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	# Configurar o texto do botão

	
	# Iniciar a animação
	animation_player.play("Blink")


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/resumo.tscn")

