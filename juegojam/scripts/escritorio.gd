extends Control

var titulos_por_dia = {
	1: [
		"Título A del día 1",
		"Título B del día 1",
		"Título C del día 1",
		"Título D del día 1",
		"Título E del día 1"
	],

	2: [
		"Título A del día 2",
		"Título B del día 2",
		"Título C del día 2",
		"Título D del día 2",
		"Título E del día 2"
	],

	3: [
		"Título A del día 3",
		"Título B del día 3",
		"Título C del día 3",
		"Título D del día 3",
		"Título E del día 3"
	],

	4: [
		"Título A del día 4",
		"Título B del día 4",
		"Título C del día 4",
		"Título D del día 4",
		"Título E del día 4"
	],
	5: [
		"Título A del día 5",
		"Título B del día 5",
		"Título C del día 5",
		"Título D del día 5",
		"Título E del día 5"
	]
}
var titulo_elegido = ""

var respuestas = {
	"A": 0,
	"B": 0,
	"C": 0,
	"D": 0,
	"E": 0
}

var interactuo_a = false
var interactuo_b = false
var interactuo_c = false
var interactuo_d = false

@export var pantallaCompu : Control

@export var pantalla_resultado : Control
@export var titulo_resultado : Label

@export var titulo_a : Label
@export var titulo_b : Label
@export var titulo_c : Label
@export var titulo_d : Label
@export var titulo_e : Label

@export var opcion_a : TextureButton
@export var opcion_b : TextureButton
@export var opcion_c : TextureButton
@export var opcion_d : TextureButton

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
	interactuo_d = true

func mostrar_contenido_dia(contenedor):
	for contenido in contenedor.get_children():
		contenido.visible = false

	var contenido_actual = contenedor.get_node("Dia" + str(Global.dia))
	contenido_actual.visible = true
	
func _on_celu_derecha_pressed() -> void:
	pantallaCelu.visible=true
	interactuo_c = true
	mostrar_contenido_dia(pantallaCelu)

func _on_compu_pressed() -> void:
	interactuo_b = true
	pantallaCompu.visible = true
	mostrar_contenido_dia(pantallaCompu)


func _on_celu_izquierda_pressed():
	click_sound.play()
	interactuo_a = true

func _on_timer_timeout() -> void:
	cargar_titulos()
	pantallaEleccion.visible=true
	if interactuo_a:
		opcion_a.visible = true
	else:
		opcion_a.visible = false
	if interactuo_b:
		opcion_b.visible = true
	else:
		opcion_b.visible = false
	if interactuo_c:
		opcion_c.visible = true
	else:
		opcion_c.visible = false
	if interactuo_d:
		opcion_d.visible = true
	else:
		opcion_d.visible = false

func elegir_titulo(opcion, texto_titulo):
	titulo_elegido = opcion
	Global.respuestas[opcion] += 1

	pantallaEleccion.visible = false
	pantalla_resultado.visible = true

	titulo_resultado.text = texto_titulo

	if opcion == "A":
		titulo_resultado.text = "Título de la opción A"

	elif opcion == "B":
		titulo_resultado.text = "Título de la opción B"

	elif opcion == "C":
		titulo_resultado.text = "Título de la opción C"

	elif opcion == "D":
		titulo_resultado.text = "Título de la opción D"

	elif opcion == "E":
		titulo_resultado.text = "Título de la opción E"


	# La ruta solamente se decide en el día 2
	if Global.dia == 2:
		if opcion == "A" or opcion == "C":
			Global.ruta = "A"

		elif opcion == "B" or opcion == "D" or opcion == "E":
			Global.ruta = "B"


	# Esto tiene que estar FUERA del if anterior
	Global.dia += 1

	print("Nuevo día: ", Global.dia)
	print("Ruta: ", Global.ruta)

	get_tree().change_scene_to_file("res://escenas/pantalla2.tscn")

func _on_opcion_a_pressed() -> void:
	elegir_titulo("A", titulos_por_dia[Global.dia][0])


func _on_opcion_b_pressed() -> void:
	elegir_titulo("B", titulos_por_dia[Global.dia][1])


func _on_opcion_c_pressed() -> void:
	elegir_titulo("C", titulos_por_dia[Global.dia][2])


func _on_opcion_d_pressed() -> void:
	elegir_titulo("D", titulos_por_dia[Global.dia][3])


func _on_opcion_e_pressed() -> void:
	elegir_titulo("E", titulos_por_dia[Global.dia][4])

func cargar_titulos():
	var titulos = titulos_por_dia[Global.dia]

	titulo_a.text = titulos[0]
	titulo_b.text = titulos[1]
	titulo_c.text = titulos[2]
	titulo_d.text = titulos[3]
	titulo_e.text = titulos[4]


func _on_continuar_pressed() -> void:
	if Global.dia >= Global.dia_final:
		print("Terminó el juego")
		# Después ponemos acá la escena final
	else:
		Global.dia += 1
		get_tree().change_scene_to_file("res://escenas/pantalla1.tscn")
