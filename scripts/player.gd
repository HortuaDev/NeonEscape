extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -350.0

var spawn_position = Vector2.ZERO
var estaba_en_suelo = false

@onready var animated_sprite = $AnimatedSprite2D
@onready var sonido_salto = $SonidoSalto
@onready var sonido_pasos = $SonidoPasos
@onready var sonido_herido = $SonidoHerido
@onready var sonido_aterrizaje = $SonidoAterrizaje

func _ready():
	spawn_position = position
	add_to_group("player")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	# Sonido aterrizaje
	if is_on_floor() and not estaba_en_suelo:
		sonido_aterrizaje.play()
	estaba_en_suelo = is_on_floor()
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sonido_salto.play()
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		# Sonido pasos solo si está en el suelo
		if is_on_floor() and not sonido_pasos.playing:
			sonido_pasos.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sonido_pasos.stop()
	
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
		sonido_pasos.stop()
	elif direction != 0:
		animated_sprite.play("walk")
		animated_sprite.flip_h = direction < 0
	else:
		animated_sprite.play("idle")
	
	move_and_slide()
