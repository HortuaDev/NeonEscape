extends CanvasLayer

@onready var label_puntos = $LabelPuntos
@onready var label_vidas = $LabelVidas

func _process(_delta):
	label_puntos.text = str(GameManager.puntos) + " PTS"
	label_vidas.text = "Vidas: " + str(GameManager.vidas)
