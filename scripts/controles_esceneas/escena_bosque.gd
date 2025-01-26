extends Control

@onready var fade_black = $FadeBlack
@onready var text = $Control/Panel/Text
var textoIndex = 0
var canShowNextText = false
const NIEBLA_2 = preload("res://assets/escenas/niebla2.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	fadeInText()
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 3)
	await fadeBlackTween.finished
	fade_black.visible = false

func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property($Control, "modulate", Color(1,1,1,1), 2)
	$Control/Portrait.texture = preload("res://assets/portraits/hugo.png")
	await fadeInTween.finished
	showTexto("Esto es insoportable. No puede ser posible que mi pequeña Lucy no esté por ningún lado. Los mensajes escalofriantes que recibo son producto de mi mente… ¿Verdad? La brisa que se cuela entre los árboles del bosque me susurra que debo seguir adelante. Lucy, no te preocupes, te encontraré.")

func showTexto(string):
	$Control.hide_arrow()
	text.loadText(string, "HUGO")
	await text.textFinished
	$Control.show_arrow()
	textoIndex += 1
	canShowNextText = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("accion") and canShowNextText:
		canShowNextText = false
		if textoIndex == 1:
			showTexto("El bosque me rodea en la noche huérfana, los sátiros y las ninfas corren a mi alrededor y la noche cubre sus rostros con la negra sábana, pero sus voces, ay, las voces inundan mi conciencia y no se callan ni un segundo. Estoy mareado. ¿Lucy, dónde estás?…")
		elif textoIndex == 2:
			showTexto("Selene, diosa, conduce tu carro por la celeste bóveda e ilumina el camino hacia mi hija. Dame, oh, virtuosa mujer, un indicio de cómo encontrar a quien busco. Ayúdame, por favor… ")
		elif textoIndex == 3:
			$Control.show_options(["Buscar el piso con la vista", "Palpar el piso con las manos"])
		elif textoIndex == 4:
			showTexto("Inerte, tu pelaje se enfría en el bautismal rocío de la madrugada…")
		elif textoIndex == 5:
			showTexto("Tu sangre o dulce fruta del árbol trunco me guía al sendero…")
		elif textoIndex == 6:
			await showTexto("Debo encontrar a Lucy ya.")
			$Control.show_options(["Correr al corazon del bosque"])


func _on_opcion_1_pressed():
	if $Control/ChoicesContainer/Opcion1/Texto.text == "Buscar el piso con la vista":
		$Control.visible = false
	elif $Control/ChoicesContainer/Opcion1/Texto.text == "Correr al corazon del bosque":
		get_tree().change_scene_to_file("res://scenes/escena_final.tscn")


func _on_opcion_2_pressed():
	if $Control/ChoicesContainer/Opcion2/Texto.text == "Palpar el piso con las manos":
		triggerReaccionConejo()

func triggerReaccionConejo():
	$Niebla.texture = NIEBLA_2
	$ConejoManos/AnimationPlayer.play("subirConejo")
	showTexto("¡Oh, dulce criatura! ¿Qué designio ocultas en tu rígido cuerpo…?")

func _on_conejin_pressed():
	$Control.visible = true
	triggerReaccionConejo()
	$Conejin.queue_free()
