extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Joueur:
		print("collecter")
		Main.augmenter_gem()
		$SfxCoin.play()
		# Attendre la fin du son
		await $SfxCoin.finished
		queue_free()
