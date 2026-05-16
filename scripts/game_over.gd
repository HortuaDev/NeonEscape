extends Control

@onready var label_puntuacion = $VBoxContainer/LabelPuntuacion

func _ready():
	# Mostrar puntuación final
	label_puntuacion.text = str(GameManager.puntos) + " PTS"
	
	# Conectar botones
	$VBoxContainer/BotonReiniciar.pressed.connect(_on_reiniciar)
	$VBoxContainer/BotonMenu.pressed.connect(_on_menu)

func _on_reiniciar():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_menu():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
