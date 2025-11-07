extends Area2D

@export var groupe_cle:String

func _on_body_entered(body: Node2D) -> void:
	# if body is Joueur:
	print("collecter cle")
	Main.debloquer_cle(self)
	
	# Desactive collision
	$CollisionShape2D.disabled = true
	# Ajouter des rétroactions
	$KeyRed.visible = false
	%CleSfx.play()
	# Attendre la fin du son
	await %CleSfx.finished 
	queue_free()
