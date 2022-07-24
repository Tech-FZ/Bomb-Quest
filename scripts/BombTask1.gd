extends Node2D


# Declare member variables here. Examples:
var lvlpart = 1
var tries = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ArrowBody_player_succeeded_in_part():
	if lvlpart == 1:
		$LevelPart1/Target/Sprite.texture = load("res://assets/task_component2_green.png")
		$ArrowBody.success_possible = false
		$ArrowBody.position.x += 100
		$ArrowBody.position.y = 0
		lvlpart += 1
		
	elif lvlpart == 2:
		$LevelPart2/Target/Sprite.texture = load("res://assets/task_component2_green.png")
		$ArrowBody.success_possible = false
		$ArrowBody.position.x += 100
		$ArrowBody.position.y = 0
		lvlpart += 1
		
	elif lvlpart == 3:
		$LevelPart2/Target/Sprite.texture = load("res://assets/task_component2_green.png")
		$ArrowBody.success_possible = false
		get_tree().change_scene("res://scenes/Level1Success.tscn")


func _on_ArrowBody_player_tries_again():
	tries += 1
	$Label.text = "Tries: " + str(tries)
