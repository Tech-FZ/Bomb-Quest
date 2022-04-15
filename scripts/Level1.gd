extends Node

# Declare member variables here. Examples:
var gameStarted = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameStarted == false:
		$TimeLabel.text = str(int($StartTimer.time_left + 1))

	else:
		$TimeLabel.text = str(int($BombTimer.time_left + 1))

func _on_Bomb_body_entered(body):
	if body.get_name() == "Player":
		# Please note that this is only placeholder code
		get_tree().change_scene("res://scenes/MainMenu.tscn")
		# End of placeholder code



func _on_StartTimer_timeout():
	gameStarted = true
	$BombTimer.start()
	$Player.left_possible = true
	$Player.right_possible = true
	$Player.up_possible = true
	$Player.down_possible = true

func _on_BombTimer_timeout():
	# It probably gets more complex here
	get_tree().change_scene("res://scenes/Level1.tscn")
