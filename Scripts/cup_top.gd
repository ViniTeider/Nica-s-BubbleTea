extends Sprite2D

const BLUE_CUP_TOP = preload("res://Assets/cups/blue/blue_cup_top.png")
const GREEN_CUP_TOP = preload("res://Assets/cups/green/green_cup_top.png")
const PURPLE_CUP_TOP = preload("res://Assets/cups/purple/purple_cup_top.png")
const RED_CUP_TOP = preload("res://Assets/cups/red/red_cup_top.png")

var chosen_color: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index = 1

func _process(_delta: float) -> void:
	match chosen_color:
		0:
			self.set_texture(BLUE_CUP_TOP)
		1:
			self.set_texture(GREEN_CUP_TOP)
		2:
			self.set_texture(PURPLE_CUP_TOP)
		3:
			self.set_texture(RED_CUP_TOP)
