extends Node2D

@onready var visible_on_screen_notifier_2d : VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var move_component : MoveComponent= $MoveComponent
@onready var shake_component : ShakeComponent = $ShakeComponent
@onready var stats_component : StatsComponent = $StatsComponent
@onready var scale_component : ScaleComponent = $ScaleComponent
@onready var flash_component : FlashComponent = $FlashComponent
@onready var hitbox_component : HitboxComponent = $HitboxComponent
@onready var hurtbox_component : HurtboxComponent = $HurtboxComponent
@onready var destroyed_component : DestroyedComponent = $DestroyedComponent

func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hitbox : HitboxComponent):		
		shake_component.tween_shake()
		scale_component.tween_scale()
		flash_component.flash()
	)
	
	stats_component.no_health.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
