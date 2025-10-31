extends Area2D




func _gem_touchee(body):
	if body is Joueur:
		Main.augmenter_gem()
		call_deferred("queue_free")
