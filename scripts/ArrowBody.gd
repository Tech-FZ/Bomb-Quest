extends KinematicBody2D


# Declare member variables here. Examples:
var success_possible = false
signal player_succeeded_in_part
signal player_tries_again
var arr_goes_down = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if arr_goes_down:
		position.y += 3 * delta * 50
		
		if position.y >= 337:
			arr_goes_down = false
	
	elif arr_goes_down == false:
		position.y -= 3 * delta * 50
		
		if position.y <= 0:
			arr_goes_down = true
		
	if Input.is_action_just_pressed("action"):
		if success_possible:
			emit_signal("player_succeeded_in_part")
		
		else:
			position.y = 0
			emit_signal("player_tries_again")


func _on_Target_body_entered(body):
	success_possible = true


func _on_Target_body_exited(body):
	success_possible = false
