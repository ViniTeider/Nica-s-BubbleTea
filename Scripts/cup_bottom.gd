class_name CupBottom
extends Sprite2D

func set_bottom_color(chosen_color: int) -> void:
	match chosen_color:
		0:
			self.set_texture(Utils.BLUE_CUP_BOTTOM)
		1:
			self.set_texture(Utils.GREEN_CUP_BOTTOM)
		2:
			self.set_texture(Utils.PURPLE_CUP_BOTTOM)
		3:
			self.set_texture(Utils.RED_CUP_BOTTOM)
