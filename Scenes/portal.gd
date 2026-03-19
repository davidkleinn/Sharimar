extends Area2D
@export var fase = ""
var entered = false
# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	entered = true
	
func _on_body_exited(body):
	entered = false
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (entered == true) && Input.is_action_just_pressed("changeScene"):
		get_tree().change_scene_to_file(fase)






