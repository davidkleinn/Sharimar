extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelGameOver.visible = false
	$ButtonMenu.visible=false
	$ButtonRestart.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func die():
	$ButtonMenu.visible=true
	$ButtonRestart.visible=true
	$LabelGameOver.visible = true
	get_node("Player").set_physics_process(false)
	$Player/AnimatedSprite2D.play("Nikki_Death")
	
func restart_scene():
	get_tree().reload_current_scene()

func _on_button_restart_button_down():
	restart_scene()

func _on_button_menu_button_down():
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
