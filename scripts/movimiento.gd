extends CharacterBody2D

@export var speed = 100

func _physics_process(delta):
	var input_direction = Input.get_vector("izquierda","derecha","arriba","abajo")
	velocity = input_direction * speed
	move_and_slide()
