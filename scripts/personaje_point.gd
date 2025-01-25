extends CharacterBody2D

@export var speed = 200

func _physics_process(delta):
	var input = Input.get_vector("izquierda","derecha","arriba","abajo")
	velocity = input * speed
	move_and_slide()
