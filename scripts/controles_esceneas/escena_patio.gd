extends Control
@onready var fade_black = $FadeBlack
@onready var text: ControlTexto = $Control/Panel/Text

var textoIndex = 0
var canShowNextText = false

# Called when the node enters the scene tree for the first time.
func _ready():
	fadeInText()
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 3)
	await fadeBlackTween.finished
	fade_black.visible = false
	
func _process(_delta):
	if Input.is_action_pressed("accion") and canShowNextText:
		canShowNextText = false
		if textoIndex == 1:
			showTexto("¿Y ese brillo que se refleja en los arbustos del patio? Qué extraño…")
		elif textoIndex == 2:
			$Control.visible = false
		elif textoIndex == 3:
			await showTexto("Debe haber sido… ")
			$Control.show_options(["Un fantasma", "Una alucinacion"])
		elif textoIndex == 6:
			get_tree().change_scene_to_file("res://scenes/escena_bosque.tscn")
			
	
func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 2)
	$Control/Portrait.texture = preload("res://assets/portraits/hugo.png")
	await fadeInTween.finished
	showTexto("La noche gélida cae sobre mis hombros pesados y la neblina espesa no me permite pensar con claridad. ¿Lucy, estás por aquí? ¿Dónde te metiste? Tal vez, las pastillas estén nublando mi razón y solo esté alucinando.")
	
func showTexto(string):
	$Control.hide_arrow()
	text.loadText(string, "HUGO")
	await text.textFinished
	$Control.show_arrow()
	textoIndex += 1
	canShowNextText = true


func _on_piedra_pressed():
	$Piedra.queue_free()
	$Espejito.disabled = false


func _on_espejito_pressed():
	$Espejito.queue_free()
	$EspejoMano/AnimationPlayer.play("subirEspejo")
	await $EspejoMano/AnimationPlayer.animation_finished
	$EspejoMano.visible = false
	$Control.visible = true
	showTexto("¡Lucy! ¡Dios mío! ¡Qué te ha pasado!")
	


func _on_opcion_1_pressed():
	if $Control/ChoicesContainer/Opcion1/Texto.text == "Un fantasma":
		await showTexto("Oh, cruel Dite, aleja tus garras de la flor infante, otorga un último suspiro a mi alma condenada, imparte en el espectro metamorfosis y elimina el horrible espejismo. Aliada de lo inevitable, no dejes a un padre ver morir la primavera.")
		$Control.show_options(["Correr hacia el bosque", "Gritarle"])
	elif $Control/ChoicesContainer/Opcion1/Texto.text == "Correr hacia el bosque":
		get_tree().change_scene_to_file("res://scenes/escena_bosque.tscn")

func _on_opcion_2_pressed():
	if $Control/ChoicesContainer/Opcion2/Texto.text == "Una alucinacion":
		await showTexto("Debo estar perdiendo la cordura, me parece escuchar la voz de Lucy viniendo del bosque. Algo malo debe haber pasado, debo correr a buscarla. Dite, por favor, aleja tus sombras de mi hija, permíteme correr a sus brazos y sentir su dulce aliento en mi pecho otra vez.")
		$Control.show_options(["Correr hacia el bosque"])
	elif $Control/ChoicesContainer/Opcion2/Texto.text == "Gritarle":
		showTexto("Lucy! Lucy! Eres tu?!")
