extends Area2D

# Puntos que da este item al recogerlo
const PUNTOS = 10

func _ready():
	# Conectar la señal cuando algo entra en el área
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		GameManager.sumar_puntos(PUNTOS)
		GameManager.item_recogido()
		queue_free()
