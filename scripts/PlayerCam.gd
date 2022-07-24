extends Camera2D


# Declare member variables here. Examples:
var turn = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Player_hud_should_not_turn():
	$HUD.scale.x *= -1
	
	if turn == false:
		$HUD.position.x = 500.029
		$HUD.position.y = -286.514
		turn = true
	
	else:
		$HUD.position.x = -500.029
		$HUD.position.y = -286.514
		turn = false
