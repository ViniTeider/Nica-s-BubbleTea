extends Node

func _ready() -> void:
	SignalBus.game_started.connect(change)

func change():
	get_tree().change_scene_to_packed(Utils.main_scn)
