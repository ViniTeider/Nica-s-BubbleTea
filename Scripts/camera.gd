extends Node

func _ready() -> void:
	SignalBus.camera_created.connect(_on_camera_created)
	
func _on_camera_created() -> void:
	add_child(Utils.camerao_scn.instantiate())
