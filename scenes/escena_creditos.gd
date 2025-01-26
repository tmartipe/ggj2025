extends Control

signal textFinished

@onready var fade_black: ColorRect = $FadeBlack
@onready var rich_text_label: RichTextLabel = $TextureRect/RichTextLabel
@onready var texture_rect: TextureRect = $TextureRect

func _ready():
	var fadeBlackTween = create_tween()
	fadeBlackTween.tween_property(fade_black, "modulate", Color(1,1,1,0), 1)
	await fadeBlackTween.finished
	fadeInText()

func fadeInText():
	var fadeInTween = create_tween()
	fadeInTween.tween_property(rich_text_label, "modulate", Color(1,1,1,1), 1)

func loadText(newText: String):
	await get_tree().create_timer(0.0005).timeout
	textFinished.emit()

func showTexto(string):
	rich_text_label.loadText(string)
	await rich_text_label.textFinished
