extends Control

@onready var fade_black = $FadeBlack
@onready var text = $Control/Panel/Text

var canShowNextText = false
var textoEscena = ["La casa tiene olor a humedad, la ventana lleva días cerrada, hace frío y hay algo de mal olor."]
@export var textoIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 3)
	await fadeBlackTween.finished
	fade_black.visible = false
	fadeInText()

func _process(_delta):
	if Input.is_action_pressed("accion") and canShowNextText:
		canShowNextText = false
		if textoIndex == 2:
			showTexto("Debo encontrarla, ¿dónde se habrá metido esa niña?, ¿por qué no vendrá a recibirme? No responde a ninguno de mis llamados, debo buscar por la casa para encontrar alguna pista de dónde puede estar.")
		elif textoIndex == 3:
			$Control.visible = false
		elif textoIndex == 4:
			$Control.visible = false
			$SalirAlPatio.visible = true

func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 2)
	$Control/Portrait.texture = preload("res://assets/portraits/hugo.png")
	await fadeInTween.finished
	await showTexto("La casa tiene olor a humedad, la ventana lleva días cerrada, hace frío y hay algo de mal olor.")
	canShowNextText = false
	$Control.hide_arrow()
	$Control.show_options(["Abrir la ventana","Prender la estufa"])

func showTexto(string):
	$Control.hide_arrow()
	text.loadText(string)
	await text.textFinished
	$Control.show_arrow()
	textoIndex += 1
	canShowNextText = true


func _on_opcion_1_pressed():
	$Control/ChoicesContainer/Opcion1.mouse_filter = MOUSE_FILTER_IGNORE
	if $Control/ChoicesContainer/Opcion1/Texto.text == "Abrir la ventana":
		showTexto("El aire fresco en mi rostro me recuerda a Lucy.")
		
	if $Control/ChoicesContainer/Opcion1/Texto.text == "Seguir llamando a Lucy":
		showTexto("Nadie responde, debe haber una pista por aquí cerca de a dónde se fue")
		
	if $Control/ChoicesContainer/Opcion1/Texto.text == "Tirar burbujas":
		await showTexto("Este es el burbujero que habíamos comprado con su madre el año pasado, ¿cómo pudo haberlo perdido? Todavía está húmedo, seguro se le cayó hace poco, Lucy debe estar cerca…")
		canShowNextText = false
		$Control.hide_arrow()
		$Control.show_options(["Seguir llamando a Lucy", "Buscar por el resto de la casa"])
	
		

func _on_opcion_2_pressed():
	$Control/ChoicesContainer/Opcion2.mouse_filter = MOUSE_FILTER_IGNORE
	if $Control/ChoicesContainer/Opcion2/Texto.text == "Prender la estufa":
		showTexto("El calor me trae el recuerdo de Lucy.")
	if $Control/ChoicesContainer/Opcion2/Texto.text == "Buscar a Lucy en la casa":
		showTexto("")
		$Control.visible = false
	if $Control/ChoicesContainer/Opcion2/Texto.text == "Buscar por el resto de la casa":
		$Control.visible = false
		$SalirAlPatio.visible = true
		

func _on_burbujero_pressed():
	$Control.visible = true
	await showTexto("El burbujero de Lucy...")
	canShowNextText = false
	$Control.hide_arrow()
	$Control.show_options(["Tirar burbujas"])


func _on_salir_al_patio_pressed():
	get_tree().change_scene_to_file("res://scenes/escena_patio.tscn")
