extends Control

@export var animacion_texto : AnimationPlayer

@export var texto : Label
@export var timerTexto : Label

@export var timer : Timer

@export var click_sound : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timerTexto.text = (str(int(timer.get_time_left())))


func _on_ventana_pressed() -> void:
	pass # Replace with function body.


func _on_celu_derecha_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/celular.tscn")


func _on_compu_pressed() -> void:
	pass 


func _on_celu_izquierda_pressed():
	click_sound.play()



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://escenas/elegir_titulo.tscn")
