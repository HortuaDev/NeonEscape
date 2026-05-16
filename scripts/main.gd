extends Node2D

func _ready():
	# Contar todos los items del nivel al inicio
	var items = get_tree().get_nodes_in_group("items")
	GameManager.items_restantes = items.size()
