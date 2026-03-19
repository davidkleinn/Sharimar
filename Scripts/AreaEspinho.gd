extends Area2D
class_name Espinho
var entered = false
var player
@export var main = Node
var has_died = false

func _on_body_entered(body:Player):
	entered = true


# Called when the node enters the scene tree for the first time.
func _ready():
	player =  get_tree().current_scene.get_node("Player")

func _on_body_exited(body):
	entered == false

func die():
	get_parent().die()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered and not has_died:
		die()
		has_died = true
