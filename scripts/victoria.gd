extends Control

func _ready():
	$VBoxContainer/LabelPuntos.text = "Puntos: " + str(GameManager.puntos)
	$VBoxContainer/BotonMenu.pressed.connect(_on_menu)

func _on_menu():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
