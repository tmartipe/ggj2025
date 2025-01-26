extends Control

@onready var fade_black = $FadeBlack

# Called when the node enters the scene tree for the first time.
func _ready():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 3)
	await fadeBlackTween.finished
	fade_black.visible = false

func _on_tirar_burbujas_boton_pressed():
	var tweenCry = create_tween()
	tweenCry.tween_property($MenCries, "volume_db", -20, 4)
	fade_black.visible = true
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,1), 4)
	await fadeBlackTween.finished
	$BurbujeroMano/BaloonPop.play()
	await $BurbujeroMano/BaloonPop.finished
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
