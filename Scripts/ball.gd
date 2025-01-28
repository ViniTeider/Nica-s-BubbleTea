extends RigidBody2D
class_name Ball

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var evaporate_timer: Timer = $EvaporateTimer

var scale_modifier: float = randf_range(0.5, 0.8)
var point: int = 1
var parent: Cup

func _on_evaporate_timer_timeout() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.spawned_balls.erase(self)
	queue_free()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Gets a random sprite when initiating the ball
	sprite_2d.set_texture(Utils.tea_bubble_sprites[randi_range(0, len(Utils.tea_bubble_sprites) -1)])
	sprite_2d.scale = Vector2(scale_modifier, scale_modifier)
	collision_shape_2d.scale = Vector2(scale_modifier, scale_modifier)
	

func evaporate(instant: bool = false) -> void:
	if instant:
		evaporate_timer.start(0.1)
	else:
		evaporate_timer.start()
