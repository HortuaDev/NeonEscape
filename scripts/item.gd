extends Area2D

const PUNTOS = 10

@onready var sonido_recolectar = $SonidoRecolectar

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		# Desactivar colisión inmediatamente para evitar doble recogida
		$CollisionShape2D.set_deferred("disabled", true)
		# Ocultar el sprite inmediatamente
		$AnimatedSprite2D.visible = false
		# Sumar puntos
		GameManager.sumar_puntos(PUNTOS)
		GameManager.item_recogido()
		# Reproducir sonido
		sonido_recolectar.play()
		# Esperar a que termine el sonido y eliminar
		await sonido_recolectar.finished
		queue_free()
