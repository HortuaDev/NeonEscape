extends Area2D

const PUNTOS = 10

@onready var sonido_recolectar = $SonidoRecolectar

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		GameManager.sumar_puntos(PUNTOS)
		GameManager.item_recogido()
		sonido_recolectar.play()
		# Esperar a que termine el sonido antes de eliminar
		await sonido_recolectar.finished
		queue_free()
