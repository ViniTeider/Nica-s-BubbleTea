extends RigidBody2D
class_name Ball

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

# Loads all the possible variables
const GREEN_BALL = preload("res://Assets/balls/green_ball.png")
const GREEN_BALL_VARIATION = preload("res://Assets/balls/green_ball_variation.png")
const GREY_BALL = preload("res://Assets/balls/grey_ball.png")
const GREY_BALL_VARIATION = preload("res://Assets/balls/grey_ball_variation.png")
const RED_BALL = preload("res://Assets/balls/red_ball.png")
const RED_BALL_VARIATION = preload("res://Assets/balls/red_ball_variation.png")
const REGULAR_BALL = preload("res://Assets/balls/regular_ball.png")
const REGULAR_BALL_VARIATION = preload("res://Assets/balls/regular_ball_variation.png")

var list_of_skins: Array = [GREEN_BALL, GREEN_BALL_VARIATION, GREY_BALL, GREY_BALL_VARIATION, RED_BALL, RED_BALL_VARIATION, REGULAR_BALL, REGULAR_BALL_VARIATION]
var scale_modifier: float = 0.6
var point: int = 1
var parent: Cup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Gets a random sprite when initiating the ball
	sprite_2d.set_texture(list_of_skins[randi_range(0, len(list_of_skins) -1)])
	sprite_2d.scale = Vector2(scale_modifier, scale_modifier)
	collision_shape_2d.scale = Vector2(scale_modifier, scale_modifier)
	
func _on_timer_timeout() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.spawned_balls.erase(self)
	queue_free()
	
	
func evaporate(instant: bool = false) -> void:
	if instant:
		timer.start(0.5)
	else:
		timer.start()
