extends Node

# Declare member variables here. Examples:
var gameStarted = false
var bombTaskScene = preload("res://scenes/BombTask3.tscn")
var bombTaskScene2 = preload("res://scenes/BombTask4.tscn")
var player_hearts = 3
var bombs_left = 2
var heartAway = preload("res://assets/heart_away.png")
var samurai_left = true
var samurai2_left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/AnimatedSprite.animation = "weaponized"
	$Player.moving_left = false
	$Player/PlayerCam/HUD/StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameStarted == false:
		$Player/PlayerCam/HUD/TimeLabel.text = str(int($Player/PlayerCam/HUD/StartTimer.time_left + 1))

	else:
		$Player/PlayerCam/HUD/TimeLabel.text = str(int($Player/PlayerCam/HUD/BombTimer.time_left + 1))

	if has_node("Samurai"):
		if $Samurai.position.x >= 614 and gameStarted:
			$Samurai.left_possible = true
			$Samurai.right_possible = false
	
		elif $Samurai.position.x <= 268 and gameStarted:
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
			
	if has_node("Samurai2"):
		if $Samurai2.position.x >= 921 and gameStarted:
			$Samurai2.left_possible = true
			$Samurai2.right_possible = false
	
		elif $Samurai2.position.x <= 629 and gameStarted:
			$Samurai2.left_possible = false
			$Samurai2.right_possible = true
		
		if $Samurai2.left_possible:
			if samurai2_left:
				$Samurai2.scale.x *= -1
				samurai2_left = false
			
			$Samurai2.position.x -= $Samurai2.velocity.x / delta / 100
		
		elif $Samurai2.right_possible:
			if samurai2_left == false:
				$Samurai2.scale.x *= -1
				samurai2_left = true
			
			$Samurai2.position.x += $Samurai2.velocity.x / delta / 100
			
	if has_node("Wrestler"):
		if $Wrestler.position.y >= -57 and gameStarted:
			$Wrestler.up_possible = true
			$Wrestler.down_possible = false
			
		elif $Wrestler.position.y <= -529 and gameStarted:
			$Wrestler.up_possible = false
			$Wrestler.down_possible = true
			
		if $Wrestler.up_possible:
			$Wrestler.position.y -= $Wrestler.velocity.y / delta / 100
		
		elif $Wrestler.down_possible:
			$Wrestler.position.y += $Wrestler.velocity.y / delta / 100

func _on_Bomb_body_entered(body):
	if body.get_name() == "Player":
		var bombTaskInstance = bombTaskScene2.instance()
		bombTaskInstance.position.x = -500
		bombTaskInstance.position.y = -286
			
		if $Player/PlayerCam.turn == true:
			bombTaskInstance.scale.x *= -1
			bombTaskInstance.position.x = 500
			
		$Player/PlayerCam.add_child(bombTaskInstance)
		var bombTask = $Player/PlayerCam.get_node("BombTask4")
		bombTask.connect("questSolved", self, "_on_BombTask4_questSolved")
		
		$Player.left_possible = false
		$Player.right_possible = false
		$Player.up_possible = false
		$Player.down_possible = false
		
		if has_node("Samurai"):
			$Samurai.left_possible = false
			$Samurai.right_possible = false
			$Samurai.up_possible = false
			$Samurai.down_possible = false
			
		if has_node("Samurai2"):
			$Samurai2.left_possible = false
			$Samurai2.right_possible = false
			$Samurai2.up_possible = false
			$Samurai2.down_possible = false
			
		if has_node("Wrestler"):
			$Wrestler.left_possible = false
			$Wrestler.right_possible = false
			$Wrestler.up_possible = false
			$Wrestler.down_possible = false

func _on_StartTimer_timeout():
	gameStarted = true
	$Player/PlayerCam/HUD/BombTimer.start()
	$Player.left_possible = true
	$Player.right_possible = true
	$Player.up_possible = true
	$Player.down_possible = true
	
	$Samurai.left_possible = false
	$Samurai.right_possible = true
	$Samurai.up_possible = false
	$Samurai.down_possible = false
	
	$Wrestler.left_possible = false
	$Wrestler.right_possible = false
	$Wrestler.up_possible = false
	$Wrestler.down_possible = true

func _on_BombTimer_timeout():
	get_tree().change_scene("res://scenes/Level3Fail.tscn")


func _on_Player_lost_heart():
	if player_hearts == 3:
		$Player/PlayerCam/HUD/Hearts/Heart3.texture = heartAway
	
	elif player_hearts == 2:
		$Player/PlayerCam/HUD/Hearts/Heart2.texture = heartAway
		
	elif player_hearts == 1:
		get_tree().change_scene("res://scenes/Level3Fail.tscn")
	
	player_hearts -= 1


func _on_Bomb2_body_entered(body):
	if body.get_name() == "Player":
		var bombTaskInstance = bombTaskScene.instance()
		
		bombTaskInstance.position.x = -500
		bombTaskInstance.position.y = -286
			
		if $Player/PlayerCam.turn == true:
			bombTaskInstance.scale.x *= -1
			bombTaskInstance.position.x = 500
			
		$Player/PlayerCam.add_child(bombTaskInstance)
		var bombTask = $Player/PlayerCam.get_node("BombTask3")
		bombTask.connect("questSolved", self, "_on_BombTask3_questSolved")
		$Player.left_possible = false
		$Player.right_possible = false
		$Player.up_possible = false
		$Player.down_possible = false
		
		if has_node("Samurai"):
			$Samurai.left_possible = false
			$Samurai.right_possible = false
			$Samurai.up_possible = false
			$Samurai.down_possible = false
			
		if has_node("Samurai2"):
			$Samurai2.left_possible = false
			$Samurai2.right_possible = false
			$Samurai2.up_possible = false
			$Samurai2.down_possible = false
			
		if has_node("Wrestler"):
			$Wrestler.left_possible = false
			$Wrestler.right_possible = false
			$Wrestler.up_possible = false
			$Wrestler.down_possible = false
		
func _on_BombTask3_questSolved():
	if bombs_left > 1:
		var bombTask = $Player/PlayerCam.get_node("BombTask3")
		$Player/PlayerCam.remove_child(bombTask)
		remove_child($Bomb2)
		bombs_left -= 1
		$Player.left_possible = true
		$Player.right_possible = true
		$Player.up_possible = true
		$Player.down_possible = true
		var amount_of_time = $Player/PlayerCam/HUD/BombTimer.time_left
		$Player/PlayerCam/HUD/BombTimer.start(amount_of_time + 10)
		
		if has_node("Samurai"):
			$Samurai.left_possible = false
			$Samurai.right_possible = true
			$Samurai.up_possible = false
			$Samurai.down_possible = false
			
		if has_node("Samurai2"):
			$Samurai2.left_possible = false
			$Samurai2.right_possible = true
			$Samurai2.up_possible = false
			$Samurai2.down_possible = false
				
		if has_node("Wrestler"):
			$Wrestler.left_possible = false
			$Wrestler.right_possible = false
			$Wrestler.up_possible = false
			$Wrestler.down_possible = true
	
	else:
		get_tree().change_scene("res://scenes/Level3Success.tscn")
	
func _on_BombTask4_questSolved():
	if bombs_left > 1:
		var bombTask = $Player/PlayerCam.get_node("BombTask4")
		$Player/PlayerCam.remove_child(bombTask)
		remove_child($Bomb2)
		bombs_left -= 1
		$Player.left_possible = true
		$Player.right_possible = true
		$Player.up_possible = true
		$Player.down_possible = true
		var amount_of_time = $Player/PlayerCam/HUD/BombTimer.time_left
		$Player/PlayerCam/HUD/BombTimer.start(amount_of_time + 10)
		
		if has_node("Samurai"):
			$Samurai.left_possible = false
			$Samurai.right_possible = true
			$Samurai.up_possible = false
			$Samurai.down_possible = false
			
		if has_node("Samurai2"):
			$Samurai2.left_possible = false
			$Samurai2.right_possible = true
			$Samurai2.up_possible = false
			$Samurai2.down_possible = false
				
		if has_node("Wrestler"):
			$Wrestler.left_possible = false
			$Wrestler.right_possible = false
			$Wrestler.up_possible = false
			$Wrestler.down_possible = true
	
	else:
		get_tree().change_scene("res://scenes/Level3Success.tscn")


func _on_PlayerWeaponRange_body_entered(body):
	if body.get_name().begins_with("Samurai") or body.get_name().begins_with("Wrestler"):
		var enemyToKill = get_node(body.get_name())
		remove_child(enemyToKill)
