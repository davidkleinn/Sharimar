extends Area2D
class_name Portal
var entered = false
@export var fase = ""
@export var certo = false

@onready var label = $Label


func _on_body_entered(body):
	if self.name == "AreaResposta1" && Global.resp1 == Global.resp_certa:
		certo = true
	if self.name == "AreaResposta2" && Global.resp2 == Global.resp_certa:
		certo = true
	#else:
		#body.die()
	entered = true
	
func _on_body_exited(body):
	entered = false
	
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (entered == true):
		if certo == true && Input.is_action_just_pressed("changeScene"):
			get_tree().change_scene_to_file(fase)
			#await get_tree().create_timer(1.0).timeout
		elif certo == false && Input.is_action_just_pressed("changeScene"):
			get_parent().die()


func ativa():
	certo = true
