class_name ViajarCollision
extends Area2D

@onready var viajar_ui = $ViajarUI
@export var sceneTochange: PackedScene
var canChangeScene: bool = false

func _on_body_entered(body):
	var tween = create_tween()
	tween.tween_property(viajar_ui, "modulate", Color(1,1,1,1), 0.3)
	canChangeScene = true

func _on_body_exited(body):
	var tween = create_tween()
	tween.tween_property(viajar_ui, "modulate", Color(1,1,1,0), 0.3)
	canChangeScene = false
	
func changeSceneTo():
	if canChangeScene and Input.is_action_just_pressed("accion"):
		get_tree().change_scene_to_packed(sceneTochange)
		
func _process(_delta):
	changeSceneTo()
		
