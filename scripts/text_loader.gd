extends RichTextLabel
class_name ControlTexto

signal textFinished
@onready var pluma_sfx = $TextSFX
const KEYS = [preload("res://audio/a.wav"), preload("res://audio/b.wav")]
const PLUMA = preload("res://audio/pluma.wav")

func loadText(newText: String, character: String):
	text = ""
	if character == "HUGO":
		pluma_sfx.stream = PLUMA
		pluma_sfx.play()
	for i in range(0, newText.length()):
		if character == "MEDICA":
			pluma_sfx.stream = KEYS.pick_random()
			pluma_sfx.play()
		text += newText[i]
		await get_tree().create_timer(0.05).timeout
	textFinished.emit()
	
