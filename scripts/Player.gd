extends KinematicBody2D


# Declare member variables here. Examples:
var velocity = Vector2(5, 5)
var left_possible = false
var right_possible = false
var up_possible = false
var down_possible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("move_left") and left_possible:
		position.x -= velocity.x / delta / 100

	if Input.is_action_pressed("move_right") and right_possible:
		position.x += velocity.x / delta / 100
		
	if Input.is_action_pressed("move_up") and up_possible:
		position.y -= velocity.x / delta / 100
		
	if Input.is_action_pressed("move_down") and down_possible:
		position.y += velocity.x / delta / 100

func _on_Area2D_body_entered(body):
	if body.get_name().begins_with("Wall"):
		if position.x <= body.position.x + 14.5:
			right_possible = false
			
			if (body.position.x - 14.5 >= body.position.y + 14.5) == false:
				down_possible = true
				
			if (body.position.x - 14.5 >= body.position.y - 14.5) == false:
				up_possible = true
			
		if position.x >= body.position.x - 14.5:
			left_possible = false
			
			if (body.position.x - 14.5 <= body.position.y + 14.5) == false:
				down_possible = true
				
			if (body.position.x - 14.5 <= body.position.y - 14.5) == false:
				up_possible = true
			
		if position.y <= body.position.y + 14.5:
			down_possible = false
			
			if (body.position.y + 14.5 >= body.position.x + 14.5) == false:
				right_possible = true
				
			if (body.position.y + 14.5 >= body.position.x - 14.5) == false:
				left_possible = true
			
		if position.y >= body.position.y - 14.5:
			up_possible = false
			
			if (body.position.y - 14.5 <= body.position.x + 14.5) == false:
				right_possible = true
				
			if (body.position.y - 14.5 <= body.position.x - 14.5) == false:
				left_possible = true


func _on_Area2D_body_exited(body):
	if body.get_name().begins_with("Wall"):
		left_possible = true
		right_possible = true
		up_possible = true
		down_possible = true
