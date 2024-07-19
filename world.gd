extends Node2D

@export var game_stats: GameStats

@onready var ship : Node2D = $Ship
@onready var score_label: Label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label) #connecting to the function to udpate the score.
	
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)
	

# This function updates the score label, it takes in an int for the new score.
func update_score_label(new_score : int): 
	score_label.text = "Score: " + str(new_score)
