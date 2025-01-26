extends Control

@onready var portrait = $Portrait
@onready var arrow = $TextureRect

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


func _on_opcion_1_pressed():
	hide_options()

func _on_opcion_2_pressed():
	hide_options()

func show_arrow():
	arrow.visible = true

func hide_arrow():
	arrow.visible = false
