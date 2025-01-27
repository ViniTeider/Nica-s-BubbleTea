extends Node2D

func _on_texture_button_pressed() -> void:
	SignalBus.camera_created.emit()
