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
	pass

func _on_Area2D_body_entered(body):
	if body.get_name().begins_with("Wall"):
		if position.x <= body.position.x + 14:
			right_possible = false
			
			if (position.y <= body.position.y + 14) == false:
				down_possible = true
				
			if (position.y >= body.position.y - 14) == false:
				up_possible = true
			
		if position.x >= body.position.x - 14:
			left_possible = false
			
			if (position.y <= body.position.y + 14) == false:
				down_possible = true
				
			if (position.y >= body.position.y - 14) == false:
				up_possible = true
			
		if position.y <= body.position.y + 14:
			down_possible = false
			
			if (position.x <= body.position.x + 14) == false:
				right_possible = true
				
			if (position.x >= body.position.x - 14) == false:
				left_possible = true
			
		if position.y >= body.position.y - 14:
			up_possible = false
			
			if (position.x <= body.position.x + 14) == false:
				right_possible = true
				
			if (position.x >= body.position.x - 14) == false:
				left_possible = true


func _on_Area2D_body_exited(body):
	if body.get_name().begins_with("Wall"):
		left_possible = true
		right_possible = true
		up_possible = true
		down_possible = true
