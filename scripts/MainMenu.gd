extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayBtn_pressed():
	# Might get more complex as a save feature is possible
	get_tree().change_scene("res://scenes/Level1.tscn")


func _on_ExitBtn_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)


func _on_AboutBtn_pressed():
	get_tree().change_scene("res://scenes/About.tscn")
