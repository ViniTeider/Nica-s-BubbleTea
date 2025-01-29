extends Node2D

func _on_texture_button_pressed() -> void:
	Utils.transition_to(Utils.main_scn.instantiate())
