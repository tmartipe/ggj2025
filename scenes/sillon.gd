extends TextureButton

func _on_pressed():
	var tween_animation = create_tween()
	texture_hover = null
	tween_animation.tween_property(self, "position", Vector2(800,218), 1)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	
