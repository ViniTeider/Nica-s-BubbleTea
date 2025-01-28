extends Node

func _ready() -> void:
	SignalBus.game_started.connect(_on_game_started)

func _on_game_started() -> void:
	get_tree().change_scene_to_packed(Utils.main_scn)
