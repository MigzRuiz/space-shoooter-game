extends Node2D
@onready var right_muzzle : Marker2D = $RightMuzzle
@onready var left_muzzle : Marker2D = $LeftMuzzle
@onready var spawner_component : SpawnerComponent = $SpawnerComponent
#@onready var spawner_component = $SpawnerComponent
@onready var fire_rate_timer : Timer = $FireRateTimer
@onready var scale_component : ScaleComponent = $ScaleComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var flame_animated_sprite = $Anchor/FlameAnimatedSprite
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent


func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	
func fire_lasers():
	scale_component.tween_scale()
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)

func _process(delta):
	animate_the_ship()
	
func animate_the_ship():
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("steer_left")
		flame_animated_sprite.play("steer_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("steer_right")
		flame_animated_sprite.play("steer_right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite.play("center")
	
