extends Control

@onready var portrait = $Portrait

func show_options(options: Array):
	for i in range(0, options.size()):
		var node = $ChoicesContainer.get_children()[i]
		node.visible = true
		node.get_child(0).text = options[i]
		
func show_arrow():
	pass

func hide_options():
	for child in $ChoicesContainer.get_children():
		child.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
