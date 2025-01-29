class_name Ball
extends RigidBody2D

const MAX_BALLS_SPRITE = 4
const BALL_WIDTH: int = 32
const BALL_HEIGHT: int = 32

var scale_modifier: float = randf_range(0.5, 0.8)
var point: int = 1
var parent: Cup

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var evaporate_timer: Timer = $EvaporateTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_random_skin() # Gets a random sprite when initiating the ball


func _on_evaporate_timer_timeout() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.spawned_balls.erase(self)
	queue_free()


func evaporate(instant: bool = false) -> void:
	if instant:
		evaporate_timer.start(0.1)
	else:
		evaporate_timer.start()


func set_random_skin() -> void:
	var rdn_ball = Vector2(randi_range(0, MAX_BALLS_SPRITE), 0)
	Utils.update_sprite_region(sprite_2d, rdn_ball, BALL_WIDTH, BALL_HEIGHT)
	sprite_2d.scale = Vector2(scale_modifier, scale_modifier)
	collision_shape_2d.scale = Vector2(scale_modifier, scale_modifier)
