extends Node

@export var current_scene: Node

func _ready() -> void:
	SignalBus.scene_changed.connect(_on_scene_changed)

func _on_scene_changed(new_scene: Node) -> void:
	if new_scene == null:
		push_error("Attempting to change scene to a null value")
			
	if current_scene:
		remove_child(current_scene)
		current_scene.call_deferred("queue_free")
	
	add_child(new_scene)
	current_scene = new_scene
