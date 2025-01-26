extends Control
@onready var music_player = $Music
@onready var pressSound = $PressButton
@onready var timer = Timer.new()
@onready var playAnimation = $ColorRect/VBoxContainer/Play/AnimationButton
@onready var quitAnimation = $ColorRect/VBoxContainer/Quit/AnimationButton

func _ready() -> void:
	var music = load("res://audio/ggj_title_theme.mp3")
	music_player.stream = music
	music_player.play()
	timer.wait_time = .3
	timer.one_shot = true
	add_child(timer) 
	
func _on_play_pressed() -> void:
	pressSound.play()
	playAnimation.play("animation")
	timer.start()
	await timer.timeout
	get_tree().change_scene_to_file("res://scenes/escena_carretera.tscn")

func _on_quit_pressed() -> void:
	pressSound.play()
	quitAnimation.play("animation")
	timer.start()
	await timer.timeout
	get_tree().quit()
