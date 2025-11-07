extends CanvasLayer

func _ready() -> void:
	%GemLabel.text = str(Main.gem)
	Main.gem_collectee.connect(retroaction_gem)	

func retroaction_gem(valeur_gem):
	%GemLabel.text = str(valeur_gem)
