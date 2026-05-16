extends Control

func _ready():
	# Conectar los botones a sus funciones
	$VBoxContainer/BotonJugar.pressed.connect(_on_jugar)
	$VBoxContainer/BotonSalir.pressed.connect(_on_salir)

func _on_jugar():
	# Cambiar a la escena del juego al pulsar Jugar
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_salir():
	# Cerrar el juego al pulsar Salir
	get_tree().quit()
