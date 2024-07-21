class_name PinkEnemy
extends Enemy


@onready var states = $States
@onready var move_down_state : TimedStateComponent = %MoveDownState
@onready var move_side_state : TimedStateComponent = %MoveSideState
@onready var pause_state : TimedStateComponent = %PauseState
@onready var move_side_component : MoveComponent = %MoveSideComponent
@onready var fire_state: StateComponent = %FireState
@onready var projectile_spawner_component: SpawnerComponent = %ProjectileSpawnerComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	super() #to do the ready of the parent as well.
	
	# We'll disable all of the states first.
	for state in states.get_children(): 
		state = state as StateComponent # this is just to get the autocomplete of "state"
		state.disable()
		
	move_side_component.velocity.x = [-20,20].pick_random() # Move the pink from side to side.
	
	# Moving the states to move them from one state to another.
	move_down_state.state_finished.connect(move_side_state.enable)
	move_side_state.state_finished.connect(func():
		fire_state.enable()
		scale_component.tween_scale()
		projectile_spawner_component.spawn(global_position)
		fire_state.disable()
		fire_state.state_finished.emit()
	)
	fire_state.state_finished.connect(pause_state.enable)
	pause_state.state_finished.connect(move_down_state.enable)
	
	# This will start the looping of the states
	move_down_state.enable()
