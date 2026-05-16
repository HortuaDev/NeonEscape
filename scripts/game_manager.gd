extends Node

var puntos = 0
var vidas = 3
var items_restantes = 0

func item_recogido():
	items_restantes -= 1

func sumar_puntos(cantidad):
	puntos += cantidad

func perder_vida():
	vidas -= 1
	if vidas <= 0:
		puntos = 0
		vidas = 3
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		get_tree().reload_current_scene()

func reiniciar():
	puntos = 0
	vidas = 3
	items_restantes = 0
