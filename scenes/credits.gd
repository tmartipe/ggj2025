extends Control

@onready var music_player = $Music
@onready var container1 = $Fondo/ContainerProgrammers
@onready var container2 = $Fondo/ContainerDesigners
@onready var container3 = $Fondo/ContainerWriters
@onready var container4 = $Fondo/ContainerMusic

@onready var timer = Timer.new()

func _ready() -> void:
	var music = load("res://audio/ggj_title_theme.mp3")
	music_player.stream = music
	music_player.play()
	
	timer.wait_time = 3
	timer.one_shot = true
	add_child(timer) 
	
	show_containers()

func show_containers():
	
	container1.visible = true
	timer.start()

	await timer.timeout
	container1.visible = false
	container2.visible = true
	timer.start()

	await timer.timeout
	container2.visible = false
	container3.visible = true
	timer.start()

	await timer.timeout
	container3.visible = false
	container4.visible = true
