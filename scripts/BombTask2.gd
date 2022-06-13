extends Node2D


# Declare member variables here. Examples:
var tries = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckBtn_pressed():
	if $TextEdit.text == "4":
		get_tree().change_scene("res://scenes/Level2Success.tscn")
	
	else:
		tries += 1
		var textToWrite = "Sorry, but your answer was not correct. Please try again."
		
		if tries == 3:
			textToWrite = "Sorry, but your answer was not correct. Please try again.\nHint: Start at 34 and do it reversed."
			
		$HintLabel.text = textToWrite
		$TryLabel.text = "Tries: " + str(tries)
