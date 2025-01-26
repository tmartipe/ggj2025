extends Control

@onready var portrait = $Portrait
@onready var arrow = $TextureRect
@onready var press_button = $PressButton

func show_options(options: Array):
	for i in range(0, options.size()):
		var node = $ChoicesContainer.get_children()[i]
		node.visible = true
		node.get_child(0).text = options[i]
		node.mouse_filter = MOUSE_FILTER_STOP

func hide_options():
	for child in $ChoicesContainer.get_children():
		child.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("abajo"):
		show_options(["Abrir ventana", "Apagar estufa"])
	if Input.is_action_just_pressed("arriba"):
		show_options(["Hugo"])
	pass

func show_arrow():
	arrow.visible = true

func hide_arrow():
	arrow.visible = false


func _on_opcion_1_pressed():
	$ChoicesContainer/Opcion1/AnimationButton.play("animation")
	press_button.play()
	await $ChoicesContainer/Opcion1/AnimationButton.animation_finished
	hide_options()
	$ChoicesContainer/Opcion1/AnimationButton.play("reset")


func _on_opcion_2_pressed():
	$ChoicesContainer/Opcion2/AnimationButton.play("animation")
	press_button.play()
	await $ChoicesContainer/Opcion2/AnimationButton.animation_finished
	hide_options()
	$ChoicesContainer/Opcion2/AnimationButton.play("reset")
