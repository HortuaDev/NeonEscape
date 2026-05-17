extends Control

@onready var label_puntuacion = $LabelPuntuacion

func _ready():
	# Mostrar puntuación final
	print("Puntos en game over: ", GameManager.puntos)
	label_puntuacion.text = str(GameManager.puntos) + " PTS"
	
	# Conectar botones
	$BotonReiniciar.pressed.connect(_on_reiniciar)
	$BotonMenu.pressed.connect(_on_menu)

func _on_reiniciar():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_menu():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
