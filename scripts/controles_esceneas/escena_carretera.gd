extends Control

@onready var fade_black = $FadeBlack
@onready var text = $Control/Panel/Text
@onready var auto_sfx = $AutoSFX

const HUGO_PORTRAIT: = preload("res://assets/portraits/hugo.png")
const MEDICA_PORTRAIT = preload("res://assets/portraits/medica.png")
var canShowNextText = false
var textoEscena = [
	"Paciente número 42. Hospital clínico mental n. 13 de Arizona. Paciente con amnesia disociativa con rasgos delirantes, visita número 3.",
	"El paciente continúa con delirios propios del trauma sufrido el año anterior, tendencia hacia la tensión nerviosa seguida de sucesos alucinatorios.",
	"'Posible síndrome de Angelman'. Se aconseja al paciente llevar un diario personal para registrar sus pensamientos y emociones."
]
var textoIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	auto_sfx.play()
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 1)
	await fadeBlackTween.finished
	fadeInText()

func _process(_delta):
	if Input.is_action_pressed("accion") and canShowNextText and textoIndex < 3:
		canShowNextText = false
		showTexto(textoEscena[textoIndex])
	if Input.is_action_pressed("accion") and canShowNextText and textoIndex >= 3:
			fadeOutScene()
	
func fadeOutScene():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,1), 3)
	await fadeBlackTween.finished
	get_tree().change_scene_to_file("res://scenes/escena_auto.tscn")

func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 1)
	changePortrait(MEDICA_PORTRAIT)
	await fadeInTween.finished
	showTexto(textoEscena[textoIndex])

func showTexto(string):
	$Control.hide_arrow()
	text.loadText(string, "MEDICA")
	await text.textFinished
	$Control.show_arrow()
	textoIndex += 1
	canShowNextText = true

func changePortrait(portrait):
	$Control/Portrait.texture = portrait
