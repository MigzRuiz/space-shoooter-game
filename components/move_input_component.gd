class_name MoveInputComponent # Making it a class
extends Node

@export var move_stats: MoveStats
@export var move_component: MoveComponent # Calling out the Move_Component Component


func _input(event: InputEvent): # Function to get the INPUT from an input event
	var input_axis = Input.get_axis("ui_left","ui_right") # putting the left or right input into a variable
	move_component.velocity = Vector2(input_axis * move_stats.speed,0) # multiplying 50 to either left or right, no up or down action
	
