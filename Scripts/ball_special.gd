class_name SpecialBall
extends Ball

const MAX_SPECIAL_BALL_SPRITE: int = 8
const SPECIAL_WIDTH: int  = 64
const SPECIAL_HEIGHT: int = 64

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	point = 10


func evaporate(_instant: bool = false) -> void:
	return


func set_random_skin() -> void:
	var rdn_ball = Vector2(randi_range(0, MAX_SPECIAL_BALL_SPRITE), 0)
	Utils.update_sprite_region(sprite_2d, rdn_ball, SPECIAL_WIDTH, SPECIAL_HEIGHT)
	sprite_2d.scale = Vector2(scale_modifier, scale_modifier)
	collision_shape_2d.scale = Vector2(scale_modifier, scale_modifier)
