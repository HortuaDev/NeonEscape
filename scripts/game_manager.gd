extends Node

var puntos = 0
var vidas = 3
var items_restantes = 0

func sumar_puntos(cantidad):
	puntos += cantidad

func item_recogido():
	items_restantes -= 1

func perder_vida():
	vidas -= 1
	var player = get_tree().get_first_node_in_group("player")
	if vidas <= 0:
		vidas = 3
		items_restantes = 0
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		if player:
			player.get_node("SonidoHerido").play()
			player.position = player.spawn_position
			 
func reiniciar():
	puntos = 0
	vidas = 3
	items_restantes = 0
