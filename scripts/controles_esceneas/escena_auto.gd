extends Control

var textoEscena = [
	"Me dijeron que tengo que empezar a escribir, parece que todo anda mal. La niebla se sigue apoderando de mí, todo está vacío, y desde que comenzaron las pastillas todo es silencio.",
	"Antes, con las visiones, podía verla aunque sea por momentos, pero ahora la medicación no me deja recordar nada..",
	"Me llamo",
	#En index 2 mostrar opcion y esperar a click para mover a index 3
	"Estoy volviendo de terapia. Solo yo puedo combatir la niebla, you know. Lo único que quiero es llegar a casa y abrazarla, su calor en mi pecho va a lograr que florezca este yermo corazón."
]
var textoIndex = 0
@onready var escena_auto = $"."
@onready var text: ControlTexto = $Control/Panel/Text
@onready var fade_black = $FadeBlack
var canShowNextText = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 3)
	await fadeBlackTween.finished
	fade_black.visible = false
	fadeInText()

func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 2)
	$Control/Portrait.texture = preload("res://assets/portraits/hugo.png")
	await fadeInTween.finished
	showTexto(textoEscena[textoIndex])
	
func showTexto(string):
	$Control.hide_arrow()
	text.loadText(string, "HUGO")
	await text.textFinished
	$Control.show_arrow()
	textoIndex += 1
	canShowNextText = true
	
func _process(_delta):
	if Input.is_action_pressed("accion") and canShowNextText:
		canShowNextText = false
		match textoIndex:
			4:
				fade_black.visible = true
				var fadeBlackTween = create_tween()
				fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,1), 3)
				await fadeBlackTween.finished
				get_tree().change_scene_to_file("res://scenes/escena_salon.tscn")
			2:
				await showTexto(textoEscena[textoIndex])
				$Control.show_options(["Hugo"])
			_:
				showTexto(textoEscena[textoIndex])	
		canShowNextText = false


func _on_opcion_1_pressed():
	if $Control/ChoicesContainer/Opcion1/Texto.text == "Hugo":
		showTexto(textoEscena[textoIndex])
