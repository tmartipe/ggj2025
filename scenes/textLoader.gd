extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("accion"):
		loadText("Este es el nuevo texto que tenemos que cargar. Tomandonos nuestro tiempo para mostrarlo por pantalla")

func loadText(newText: String):
	text = ""
	for i in range(0, newText.length()):
		text += newText[i]
		await get_tree().create_timer(0.1).timeout
