extends CharacterBody2D

const SPEED = 60.0
var direccion = 1

@onready var animated_sprite = $AnimatedSprite2D
@onready var raycast_derecha = $RayCastDerecha
@onready var raycast_izquierda = $RayCastIzquierda

func _ready():
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	if direccion == 1 and not raycast_derecha.is_colliding():
		direccion = -1
	elif direccion == -1 and not raycast_izquierda.is_colliding():
		direccion = 1
	
	if is_on_wall():
		direccion = -direccion
	
	velocity.x = direccion * SPEED
	animated_sprite.play("walk")
	animated_sprite.flip_h = direccion < 0
	
	move_and_slide()
	
	# Detectar colisión con el jugador después de move_and_slide
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.name == "Player":
			GameManager.perder_vida()
