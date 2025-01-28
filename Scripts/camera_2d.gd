extends Camera2D
class_name Camerao

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func switch() -> void:
	SignalBus.game_started.emit()

func _ready() -> void:
	animation_player.play("zoom in zoom out")
