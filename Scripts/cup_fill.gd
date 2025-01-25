extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index = 0
	play("Empty")
