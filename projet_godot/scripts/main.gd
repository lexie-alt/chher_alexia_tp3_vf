extends Node

@export var gem = 0
signal gem_collectee

signal cle_collectee

func debloquer_cle(cle):
	cle_collectee.emit(cle)
	
func reset():
	gem = 0	
	
func augmenter_gem():
	gem += 1
	gem_collectee.emit(gem)
	
func changer_scene(nouvelle_scene:PackedScene):
	print("changer scene")
	get_tree().call_deferred("change_scene_to_packed", nouvelle_scene)
	
