extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_TryAgainBtn_pressed():
	get_tree().change_scene("res://scenes/Level2.tscn")


func _on_Level3Btn_pressed():
	get_tree().change_scene("res://scenes/Level3.tscn")
