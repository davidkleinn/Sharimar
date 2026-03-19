extends Node

@onready var label_game_over = $LabelGameOver
@onready var balao = $"Balão"


var area_resposta_1 
var area_resposta_2
var resp1
var resp2
var resp_certa
var portal_2_position
var portal_1_position
var resp_certa_position
var portal_1_dif
var portal_2_dif
# Called when the node enters the scene tree for the first time.
func _ready():
	label_game_over.visible = false
	$ButtonMenu.visible=false
	$ButtonRestart.visible=false
func restart_scene():
	get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	area_resposta_1 = get_node("AreaResposta1")
	area_resposta_1 = get_node("AreaResposta2")
	portal_1_position = get_node("AreaResposta1/AnimatedSprite2D").global_position
	portal_2_position = get_node("AreaResposta2/AnimatedSprite2D").global_position
	resp1 = Global.resp1
		
	resp2 = Global.resp2
	resp_certa = Global.resp_certa
	if(resp1 == resp_certa):
		resp_certa_position = portal_1_position
	if(resp2 == resp_certa):
		resp_certa_position = portal_2_position
	portal_1_dif = resp_certa_position - portal_1_position
	portal_2_dif = resp_certa_position - portal_2_position


func die():
	label_game_over.visible = true
	get_node("Player").set_physics_process(false)
	$Player/AnimatedSprite2D.play("Nikki_Death")
	$ButtonMenu.visible=true
	$ButtonRestart.visible=true
	
	


func _on_button_menu_button_down():
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")

func _on_button_restart_button_down():
	restart_scene()
