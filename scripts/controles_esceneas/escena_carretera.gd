extends Control

@onready var fade_black = $FadeBlack
@onready var text = $Control/Panel/Text
const HUGO_PORTRAIT: = preload("res://assets/portraits/hugo.png")
const MEDICA_PORTRAIT = preload("res://assets/portraits/medica.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 3)
	fadeInText()


func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 2)
	changePortrait(MEDICA_PORTRAIT)
	await fadeInTween.finished
	primerTexto()

func primerTexto():
	text.loadText("Paciente número 42, Hospital clínico mental n. 13 de Arizona. Paciente con amnesia disociativa con rasgos delirantes, visita número 3.")
	await text.textFinished
	$Control.show_arrow()

func changePortrait(portrait):
	$Control/Portrait.texture = portrait


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
