extends CharacterBody2D

const SPEED = 60.0
var direccion = 1

@onready var animated_sprite = $AnimatedSprite2D
@onready var raycast_derecha = $RayCastDerecha
@onready var raycast_izquierda = $RayCastIzquierda

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	# Solo cambia dirección si detecta borde O pared, no ambos a la vez
	if direccion == 1 and not raycast_derecha.is_colliding():
		direccion = -1
	elif direccion == -1 and not raycast_izquierda.is_colliding():
		direccion = 1
	
	# Si choca con pared también cambia
	if is_on_wall():
		direccion = -direccion
	
	velocity.x = direccion * SPEED
	
	# Animación
	animated_sprite.play("walk")
	animated_sprite.flip_h = direccion < 0
	
	move_and_slide()
