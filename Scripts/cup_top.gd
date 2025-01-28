extends Sprite2D
class_name CupTop

func set_top_color(chosen_color: int) -> void:
	match chosen_color:
			0:
				self.set_texture(Utils.BLUE_CUP_TOP)
			1:
				self.set_texture(Utils.GREEN_CUP_TOP)
			2:
				self.set_texture(Utils.PURPLE_CUP_TOP)
			3:
				self.set_texture(Utils.RED_CUP_TOP)
