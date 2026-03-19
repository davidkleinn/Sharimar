extends CharacterBody2D
@export var speed: float = 50.0  # Velocidade do boneco
@onready var player = get_parent().get_node("Player")  # Supondo que o jogador está no mesmo nível de hierarquia

func _process(delta):

	if player:
		# Calcula a direção para o jogador
		var direction = (player.global_position - global_position).normalized()
		var fl = player.global_position.x - global_position.x
		# Atualiza a posição do boneco em direção ao jogador
		
		position += direction * speed * delta
		if(fl<-1):
			$AnimatedSprite2D.flip_h=true
		else: if(fl>1):
			$AnimatedSprite2D.flip_h=false
		else: if(fl>-1&&fl<1):
			$AnimatedSprite2D.play("ghost_idle")
			#play deve morrer


