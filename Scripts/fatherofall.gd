extends Node

@export var current_scene: Node

func _ready() -> void:
	SignalBus.game_started.connect(_on_game_started)
	SignalBus.scene_changed.connect(_on_scene_changed)


func _on_game_started() -> void:
	SignalBus.camera_created.emit()
	#get_tree().change_scene_to_packed(Utils.main_scn)


func _on_scene_changed(new_scene: Node) -> void:
	if new_scene == null:
		return
	
	if current_scene:
		remove_child(current_scene)
		current_scene.call_deferred("queue_free")
	
	add_child(new_scene)
	current_scene = new_scene
