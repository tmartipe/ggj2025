extends RichTextLabel
class_name ControlTexto

signal textFinished

func loadText(newText: String):
	text = ""
	for i in range(0, newText.length()):
		text += newText[i]
		await get_tree().create_timer(0.0005).timeout
	textFinished.emit()
	
