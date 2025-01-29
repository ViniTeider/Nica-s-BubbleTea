class_name SpecialBall
extends Ball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	point = 10
	# Gets a random sprite when initiating the ball
	sprite_2d.set_texture(Utils.special_tea_bubble_sprites[randi_range(0, len(Utils.special_tea_bubble_sprites) -1)])
	
func evaporate(_instant: bool = false) -> void:
	return
