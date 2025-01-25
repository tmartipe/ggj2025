extends Control

var textoEscena: String = "Este es un texto de prueba, que iria acompañado de una voz en off que narre este mismo texto"
@onready var escena_auto = $"."
@onready var controlTexto: ControlTexto = $Control/Panel/Text


# Called when the node enters the scene tree for the first time.
func _ready():
	controlTexto.loadText(textoEscena)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
