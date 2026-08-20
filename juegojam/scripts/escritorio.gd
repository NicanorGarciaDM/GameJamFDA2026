extends Control

@export var animacion_texto : AnimationPlayer

@export var texto : Label

@export var pantallaEleccion : Control

@export var pantallaCelu : Control

@export var timerTexto : Label

@export var timer : Timer

@export var click_sound : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timerTexto.text = (str(int(timer.get_time_left())))


func _on_ventana_pressed() -> void:
	pass # Replace with function body.


func _on_celu_derecha_pressed() -> void:
	pantallaCelu.visible=true


func _on_compu_pressed() -> void:
	pass 


func _on_celu_izquierda_pressed():
	click_sound.play()
	pass

func _on_timer_timeout() -> void:
	pantallaEleccion.visible=true
