extends VideoStreamPlayer

func _ready():
	play()


func _on_finished():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
