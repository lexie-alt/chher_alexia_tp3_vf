extends CanvasLayer

const PLAY_ICON = preload("res://assets/spritesheets/play_icon.tres")
const PAUSE_ICON = preload("res://assets/spritesheets/pause_icon.tres")


func _ready() -> void:
	$PauseButton.icon = PAUSE_ICON
	$PauseMenu.hide()
	%InstructionsScreen.hide()


func _on_pause_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pauser()
	else:
		continuer()


func pauser():
	print("PAUSE MODE")
	$SfxSelect.play()
	$PauseButton.icon = PLAY_ICON
	$PauseMenu.show()
	get_tree().paused = true
	%ShowInstructionsButton.grab_focus.call_deferred()


func continuer():
	print("PLAY MODE")
	$SfxSelect.play()
	$PauseButton.icon = PAUSE_ICON
	$PauseMenu.hide()
	%InstructionsScreen.hide()
	get_tree().paused = false
	
	
func rejouer():
	print("PLAY REJOUER")
	$SfxSelect.play()
	await $SfxSelect.finished
	$PauseButton.icon = PAUSE_ICON
	$PauseMenu.hide()
	%InstructionsScreen.hide()
	get_tree().paused = false
	await get_tree().process_frame
	get_tree().change_scene_to_file("res://scenes/niveau_01.tscn")
	Main.reset()
	


func _on_show_instructions_button_pressed() -> void:
	print("voir instruction")
	$SfxSelect.play()
	%InstructionsScreen.show()
	%InstructionsScreen/CloseButton.grab_focus.call_deferred()


func _on_close_instructions_button_pressed() -> void:
	print("instruction fermer")
	$SfxSelect.play()
	%InstructionsScreen.hide()
	%ShowInstructionsButton.grab_focus.call_deferred()
