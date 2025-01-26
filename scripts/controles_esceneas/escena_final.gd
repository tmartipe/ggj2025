extends Control

@onready var fade_black = $FadeBlack

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
	showTexto("La noche gélida cae sobre mis hombros pesados y la neblina espesa no me permite pensar con claridad. ¿Lucy, estás por aquí? ¿Dónde te metiste? Tal vez, las pastillas estén nublando mi razón y solo esté alucinando.")
	
