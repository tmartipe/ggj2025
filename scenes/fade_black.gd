extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fadeOut():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(self, "modulate", Color(1,1,1,1), 2)
	await fadeBlackTween.finished
	
