extends Camera2D
class_name Camerao

# This camera acts like a transition camera, when it spawns, it transitions to another scene then
# destroys itself
var _transition: String = "zoom in zoom out"

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func switch(new_scene: Node) -> void:
	SignalBus.scene_changed.emit(new_scene)

func transition() -> void:
	animation_player.play(_transition)

# Changes the arguments passed to the method called during the transition animation
func set_next_scene(new_scene: Node) -> void:
	var animation = animation_player.get_animation(_transition) # Gets the transition animation
	var track_idx = animation.find_track(".", Animation.TYPE_METHOD) # Finds the Track that holds methods
	
	var key_idx = animation.track_find_key(track_idx, 1.0) # Finds the index where the switch function is called
	var key_data = animation.track_get_key_value(track_idx, key_idx)
	
	key_data["args"] = [new_scene]  # Change the argument to the new scene to be transitioned to
	animation.track_set_key_value(track_idx, key_idx, key_data)
	
