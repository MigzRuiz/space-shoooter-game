class_name GameStats

extends Resource

@export var score : int = 0 :
	set(value): # Setter function that gets run each time the "score" is changed.
		score = value 
		score_changed.emit(score)

@export var highscore : int = 0

signal score_changed(new_score)
