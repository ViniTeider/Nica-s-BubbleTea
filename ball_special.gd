extends Ball
class_name Special_ball

const CAPY_BALL = preload("res://Assets/SpecialBalls/capyBall.png")
const GOOFY_BALL = preload("res://Assets/SpecialBalls/goofy_ball.png")
const RABBIT_BALL = preload("res://Assets/SpecialBalls/rabbit_ball.png")
const NICA_BALL = preload("res://Assets/SpecialBalls/nicaBall.png")

var sprites = [CAPY_BALL, GOOFY_BALL, RABBIT_BALL, NICA_BALL]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Gets a random sprite when initiating the ball
	sprite_2d.set_texture(sprites[randi_range(0, len(sprites) -1)])
