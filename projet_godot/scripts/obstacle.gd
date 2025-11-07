extends StaticBody2D

@export var id_cle: String = "lock_rouge"

func _ready() -> void:
	add_to_group(id_cle)
	# Connexion pour écouter un signal
	Main.cle_collectee.connect(debloquer)
	

# Réponse à la notification de clé collectée
func debloquer(cle_rouge):
	print("door debloquer")
	$CollisionShape2D.disabled = true
	# Ajouter des rétroactions
	$LockRed.visible = false
	#if cle_rouge.is_in_group(id_cle):
	call_deferred("queue_free")
