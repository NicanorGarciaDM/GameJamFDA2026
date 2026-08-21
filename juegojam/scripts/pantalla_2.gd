extends Control

@onready var texto: Label = $Texto
@onready var foto: TextureRect = $TextureRect/Foto

var velocidad = 0.04

var fotos_por_dia = {
	1: {
		"default": preload("res://imgs/fotoDia1.png")
	},

	2: {
		"default": preload("res://imgs/fotoDia2.png")
	},

	3: {
		"A": preload("res://imgs/fotoDia3A.png"),
		"B": preload("res://imgs/fotoDia3B.png")
	},

	4: {
		"A": preload("res://imgs/fotoDia4A.png"),
		"B": preload("res://imgs/fotoDia4B.png")
	},

	5: {
		"default": preload("res://imgs/fotoDia5A.png")
	}
}


var textos_por_dia = {
	1: {
		"default": "Asunto: Cambio de tareas
De: nombredelcanal@armail.com.ar
Lun - 07:20 hs

Buenos días.

Habiéndolo evaluado con detenimiento, se decidió no prescindir de su puesto. ¡Felicidades! Sigue trabajando en NombreDelCanal.

Sin embargo, no se relaje; puesto que hemos delegado la redacción de las notas en nuestra nueva herramienta, VirgoCIA, su nueva función consistirá únicamente en la escritura de los titulares que este agente virtual falle en componer. Para esto, le brindaremos la fotografía que acompaña la noticia.

Tendrá hasta las 20hs del día de hoy para entregar su titular.

Esperamos que mantenga su rendimiento y refleje su compromiso con el medio en el cumplimiento de su nueva labor."
	},

	2: {
		"default": "Asunto: Foto de hoy
De: nombredelcanal@armail.com.ar
Mar - 07:21 hs

Buenos días.

Antes que nada, lo felicitamos por su primera entrega. El titular propuesto fue aprobado por VirgoCIA y acompañó eficientemente la nota escrita por esta herramienta.

A continuación, le adjuntamos la foto que deberá titular hoy. Al igual que ayer, su trabajo deberá estar terminado a las 20hs."
	},

	3: {
		"A": "Asunto: Foto y reconocimiento por su trabajo
De: nombredelcanal@armail.com.ar
Mie - 08:00 hs

Buenos días.

Su última entrega fue ejemplar; las interacciones en todas las redes y plataformas del medio aumentaron con la última nota. Si bien hubo algunos comentarios quejándose a causa de la poca relación entre lo escrito por VirgoCIA y su titular, fueron ya exitosamente eliminados y, mientras permanecieron, sólo exponenciaron la interacción con nuestro contenido. ¡Felicidades! Está trabajando mejor que nunca.

A continuación, le adjuntamos la foto que deberá titular hoy. Le reiteramos que su trabajo deberá estar terminado a las 20hs.",
		"B": "Asunto: Foto de hoy
De: nombredelcanal@armail.com.ar
Mie - 07:44 hs

Buenos días.

Dejo adjunta a este mail la foto con la que deberá trabajar hoy. Deberá entregar el titular antes de las 20hs. Si bien sus redacciones previas cumplieron con lo solicitado, le recordamos que debe atrapar la atención del público. De eso depende su puesto."
	},

	4: {
		"A": "Asunto: Buwnos diad
De: nombredelcanal@armail.com.ar
Jue - 04:18 hs

Byenos días…

Después de evaluatlo con detenimiento, fecidimos q note vamps a necesitae mas.Ahoea todo lo va a escfivir el vitgocsa aASOPDFJ
Ed una broma asdjajaajdsdpo FKA*! aca va la fotp de hoy. Acorfate se engregar anted de laz 8 !!

veso",
		"B": "Asunto: Foto
De: nombredelcanal@armail.com.ar
Jue - 07:15 hs

Buenos días.

Adjunto la foto con la que deberá trabajar hoy.

Recuerde; nuestro trabajo es pescar al público. Nadie va a leer lo que esté debajo del título."
	},

	5: {
		"default": "Asunto: Foto de hoy
De: nombredelcanal@armail.com.ar
Vie - 07:44 hs

Buenos días.

Adjunto la foto con la que deberá trabajar hoy. Deberá estar entregada a las 20hs.

Le ruego que, de haber notado alguna peculiaridad en mi última comunicación, disculpe los errores ortográficos; mi teclado es viejo y ocasionalmente comete faltas."
	}
}


func _ready() -> void:
	var variante = obtener_variante()

	foto.texture = fotos_por_dia[Global.dia][variante]

	var texto_completo = textos_por_dia[Global.dia][variante]
	animar_texto(texto_completo)


func animar_texto(texto_completo) -> void:
	texto.text = texto_completo
	texto.visible_characters = 0

	for i in range(texto_completo.length() + 1):
		texto.visible_characters = i
		await get_tree().create_timer(velocidad).timeout


func obtener_variante():
	if Global.dia == 3 or Global.dia == 4:
		return Global.ruta
	else:
		return "default"


func _on_texture_rect_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/escritorio.tscn")
