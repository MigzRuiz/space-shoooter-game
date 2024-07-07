extends Node2D
@onready var right_muzzle : Marker2D = $RightMuzzle
@onready var left_muzzle : Marker2D = $LeftMuzzle
@onready var spawner_component : SpawnerComponent = $SpawnerComponent
@onready var fire_rate_timer : Timer = $FireRateTimer


func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	
	
func fire_lasers():
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
