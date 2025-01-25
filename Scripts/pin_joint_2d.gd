extends PinJoint2D

@onready var timer: Timer = $Timer

func _ready() -> void:
	motor_enabled = true
	print(motor_target_velocity)
	
func _on_timer_timeout() -> void:
	print(motor_target_velocity)
