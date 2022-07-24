extends Node2D


# Declare member variables here. Examples:
signal questSolved
var tries = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func wrongAnswer():
	tries += 1
	$TryLabel.text = "Tries: " + str(tries)


func _on_AppleButton_pressed():
	wrongAnswer()


func _on_CarrotButton_pressed():
	wrongAnswer()


func _on_BananaButton_pressed():
	wrongAnswer()


func _on_StrawberryButton_pressed():
	emit_signal("questSolved")
