extends AnimatedSprite2D

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.win.connect(_on_win)
	play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globals.P1_score > Globals.P2_score:
		flip_h = false
	else:
		flip_h = true

func _on_timer_timeout() -> void:
	if animation == "Idle":
		play("Blink")

func _on_animation_finished() -> void:
	if animation == "Blink":
		play("Idle")

func _on_win(_winner: Cup) -> void:
	timer.stop()
	play("Pre_Dancing")
	await animation_finished
	play("Dancing")
