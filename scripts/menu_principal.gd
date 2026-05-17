extends Control

func _ready():
	$BotonJugar.pressed.connect(_on_jugar)
	$BotonSalir.pressed.connect(_on_salir)

func _on_jugar():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_salir():
	get_tree().quit()
