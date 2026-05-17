extends Control

func _ready():
	$LabelPuntos.text = str(GameManager.puntos) + " PTS"
	$BotonMenu.pressed.connect(_on_menu)

func _on_menu():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
