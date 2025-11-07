extends StaticBody2D

@export var id_cle: String = "cle_rouge"

func _ready() -> void:
	add_to_group(id_cle)
	# Connexion pour écouter un signal
	Main.cle_collectee.connect(debloquer)

# Réponse à la notification de clé collectée
func debloquer(cle):
	print("door debloquer")
	if cle.is_in_group(id_cle):
		call_deferred("queue_free")
