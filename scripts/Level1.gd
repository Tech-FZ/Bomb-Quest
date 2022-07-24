extends Node

# Declare member variables here. Examples:
var gameStarted = false
var bombTaskScene = preload("res://scenes/BombTask1.tscn")
var player_hearts = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/AnimatedSprite.animation = "default"
	$Player.moving_left = false
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameStarted == false:
		$TimeLabel.text = str(int($StartTimer.time_left + 1))

	else:
		$TimeLabel.text = str(int($BombTimer.time_left + 1))

func _on_Bomb_body_entered(body):
	if body.get_name() == "Player":
		var bombTaskInstance = bombTaskScene.instance()
		add_child(bombTaskInstance)
		$Player.left_possible = false
		$Player.right_possible = false
		$Player.up_possible = false
		$Player.down_possible = false

func _on_StartTimer_timeout():
	gameStarted = true
	$BombTimer.start()
	$Player.left_possible = true
	$Player.right_possible = true
	$Player.up_possible = true
	$Player.down_possible = true

func _on_BombTimer_timeout():
	get_tree().change_scene("res://scenes/Level1Fail.tscn")


func _on_Player_lost_heart():
	if player_hearts == 3:
		$Hearts/Heart3.texture = "res://assets/heart_away.png"
	
	elif player_hearts == 2:
		$Hearts/Heart2.texture = "res://assets/heart_away.png"
		
	elif player_hearts == 1:
		get_tree().change_scene("res://scenes/Level1Fail.tscn")
	
	player_hearts -= 1
