extends Control

@onready var fade_black = $FadeBlack
@onready var text = $Control/Panel/Text

var textoIndex = 0
var canShowNextText = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 4)
	await fadeBlackTween.finished
	fadeInText()
	fade_black.visible = false
	
func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 1)
	$Control/Portrait.texture = preload("res://assets/portraits/hugo.png")
	await fadeInTween.finished
	var fadeNieblaTween = create_tween()
	fadeNieblaTween.tween_property($Niebla, "modulate", Color(1,1,1,0), 30)
	$MenCriesSFX.play()
	showTexto("¡Oh, Lucy, qué pecado purgarás en mi nombre! Fáltame vida para purgar lo que hiciere, oh, Dite, ¿dónde, en qué lugar de mi alma, encontraré descanso en este infierno?")
	
func showTexto(string):
	$Control.hide_arrow()
	text.loadText(string, "HUGO")
	await text.textFinished
	$Control.show_arrow()
	textoIndex += 1
	canShowNextText = true
	
func _process(_delta):
	if Input.is_action_just_pressed("accion") and canShowNextText:
		canShowNextText = false
		if textoIndex == 1:
			showTexto("¿Quién, desde el oculto tablero, mueve las piezas para guiar este oscuro destino?")
		elif textoIndex == 2:
			showTexto("Por favor, musas, diosas, Tierra, madre, Sol, padre, tu alma hermana, dame una nueva oportunidad…")
		elif textoIndex == 3:
			transicionarEscena()

func transicionarEscena():
	$FadeBlack.visible = true
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,1), 5)
	await fadeBlackTween.finished
	get_tree().change_scene_to_file("res://scenes/escena_redencion.tscn")
		
