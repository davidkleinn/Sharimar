extends Control


@onready var instructions_label: Label = $InstructionsLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum TutorialSteps { STEP_A_D, STEP_SPACE, STEP_PORTAL, STEP_FINISH }
var current_step: int = TutorialSteps.STEP_A_D

var a_pressed: bool = false
var d_pressed: bool = false

func _ready():
	# Iniciar o tutorial com as instruções iniciais
	instructions_label.text = "Aperte A e D para andar"
	animation_player.play("Blink")

func _process(delta):
	match current_step:
		TutorialSteps.STEP_A_D:
			if Input.is_action_just_pressed("left"):
				a_pressed = true
				print("A tecla A foi pressionada")
			if Input.is_action_just_pressed("right"):
				d_pressed = true
				print("A tecla D foi pressionada")
			if a_pressed and d_pressed:
				current_step = TutorialSteps.STEP_SPACE
				instructions_label.text = "Aperte 'Espaco' 
				para pular"
		
		TutorialSteps.STEP_SPACE:
			if Input.is_action_just_pressed("jump"):  # "ui_select" é a ação padrão para a barra de espaço
				print("A tecla Espaço foi pressionada")
				current_step = TutorialSteps.STEP_PORTAL
				instructions_label.text = "Vá até o portal 
				e pressione 'F'"

		

		TutorialSteps.STEP_FINISH:
			pass  # O tutorial está concluído
