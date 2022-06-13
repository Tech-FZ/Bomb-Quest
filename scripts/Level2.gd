extends Node

# Declare member variables here. Examples:
var gameStarted = false
# will be replaced
var bombTaskScene = preload("res://scenes/BombTask1.tscn")
var player_hearts = 3
var heartAway = preload("res://assets/heart_away.png")
var samurai_left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/AnimatedSprite.animation = "weaponized"
	$Player.moving_left = true
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameStarted == false:
		$TimeLabel.text = str(int($StartTimer.time_left + 1))

	else:
		$TimeLabel.text = str(int($BombTimer.time_left + 1))
		
	if has_node("Samurai"):
		if $Samurai.position.x >= 363 and gameStarted:
			$Samurai.left_possible = true
			$Samurai.right_possible = false
	
		elif $Samurai.position.x <= 60 and gameStarted:
			$Samurai.left_possible = false
			$Samurai.right_possible = true
		
		if $Samurai.left_possible:
			if samurai_left:
				$Samurai.scale.x *= -1
				samurai_left = false
			
			$Samurai.position.x -= $Samurai.velocity.x / delta / 100
		
		elif $Samurai.right_possible:
			if samurai_left == false:
				$Samurai.scale.x *= -1
				samurai_left = true
			
			$Samurai.position.x += $Samurai.velocity.x / delta / 100

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
	
	$Samurai.left_possible = true
	$Samurai.right_possible = false
	$Samurai.up_possible = false
	$Samurai.down_possible = false

func _on_BombTimer_timeout():
	get_tree().change_scene("res://scenes/Level2Fail.tscn")


func _on_Player_lost_heart():
	if player_hearts == 3:
		$Hearts/Heart3.texture = heartAway
	
	elif player_hearts == 2:
		$Hearts/Heart2.texture = heartAway
		
	elif player_hearts == 1:
		get_tree().change_scene("res://scenes/Level2Fail.tscn")
	
	player_hearts -= 1


func _on_PlayerWeaponRange_body_entered(body):
	if body.get_name().begins_with("Samurai"):
		var enemyToKill = get_node(body.get_name())
		remove_child(enemyToKill)
