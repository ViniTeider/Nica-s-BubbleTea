extends Sprite2D

const BLUE_CUP_BOTTOM = preload("res://Assets/cups/blue/blue_cup_bottom.png")
const GREEN_CUP_BOTTOM = preload("res://Assets/cups/green/green_cup_bottom.png")
const PURPLE_CUP_BOTTOM = preload("res://Assets/cups/purple/purple_cup_bottom.png")
const RED_CUP_BOTTOM = preload("res://Assets/cups/red/red_cup_bottom.png")

var chosen_color: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index = 0
	
func _process(_delta: float) -> void:
	match chosen_color:
		0:
			self.set_texture(BLUE_CUP_BOTTOM)
		1:
			self.set_texture(GREEN_CUP_BOTTOM)
		2:
			self.set_texture(PURPLE_CUP_BOTTOM)
		3:
			self.set_texture(RED_CUP_BOTTOM)
