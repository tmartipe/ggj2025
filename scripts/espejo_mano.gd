extends Control
@onready var girl_laugh = $GirlLaugh
const NIEBLA_3 = preload("res://assets/escenas/niebla3.png")
@onready var niebla = $"../Niebla"

func show_lucy():
	girl_laugh.play()
	niebla.texture = NIEBLA_3
	
