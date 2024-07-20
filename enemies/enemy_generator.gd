extends Node2D

@export var GreenEnemyScene: PackedScene

var margin = 8
var screen_width =  ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component : SpawnerComponent = $SpawnerComponent
@onready var green_enemy_spawn_timer : Timer = $GreenEnemySpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	green_enemy_spawn_timer.timeout.connect(handle_spawn.bind(GreenEnemyScene,green_enemy_spawn_timer))# I need to do a bind on this beceause the timeout doesn't accept arguments

func handle_spawn(enemy_scene:PackedScene, timer):
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16)) #randomize where the enemy will go: X is for left or right, Y is -16 above the screen.
	timer.start()