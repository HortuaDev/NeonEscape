extends Area2D

@onready var fondo = $FondoColor

func _ready():
	body_entered.connect(_on_body_entered)

func _process(_delta):
	if GameManager.items_restantes <= 0:
		fondo.color = Color("#00ff88")  # Verde
	else:
		fondo.color = Color("#ff4444")  # Rojo

func _on_body_entered(body):
	if body.name == "Player":
		if GameManager.items_restantes <= 0:
			get_tree().change_scene_to_file("res://scenes/victoria.tscn")
