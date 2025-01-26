extends Node2D

@onready var cup_1_marker: Marker2D = $Cup1Marker
@onready var cup_2_marker: Marker2D = $Cup2Marker
@onready var bubble_key_spawn: Timer = $BubbleKeySpawn


@onready var special_ball_timer: Timer = $SpecialBallTimer
@onready var special_ball_marker: Marker2D = $SpecialBallMarker

@export var special_timer_low: int = 1
@export var special_timer_high: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initializates the cups
	var cup1: Cup = Utils.cup_scn.instantiate()
	var cup2: Cup = Utils.cup_scn.instantiate()
	
	cup1.id = 1
	cup2.id = 2
	
	SignalBus.win.connect(_on_win)
	
	Globals.P1_cup = cup1
	Globals.P2_cup = cup2
	
	# Sets the keys for the cups
	Globals.P1_cup.cup_keys = Utils.P1_KEYS
	Globals.P2_cup.cup_keys = Utils.P2_KEYS
	
	cup1.global_position = cup_1_marker.global_position
	cup2.global_position = cup_2_marker.global_position
	
	add_child(cup1)
	add_child(cup2)
	
	special_ball_timer.wait_time = randi_range(special_timer_low, special_timer_high)
	special_ball_timer.start()

func _on_bubble_key_spawn_timeout() -> void:
	Globals.P1_cup.spawn_key_bubble()
	Globals.P2_cup.spawn_key_bubble()
	
func _process(delta: float) -> void:
	if (bubble_key_spawn.wait_time > Globals.max_game_speed):
		bubble_key_spawn.wait_time -= delta * Globals.game_speed
	
func _on_win(winner: Cup) -> void:
	get_tree().call_group("cup1", "destroy")
	get_tree().call_group("cup2", "destroy")
	bubble_key_spawn.autostart = false
	bubble_key_spawn.stop()
	
	print(winner.name + " VENCEU !!!")
	
	var force = Vector2(randf_range(-300, 300), -300)
	
	
	if Globals.P1_cup != winner:
		Globals.P2_cup.fill()
		get_tree().call_group("ball1", "apply_force", force)
		get_tree().call_group("ball1", "evaporate")
		
	elif Globals.P2_cup != winner:
		Globals.P1_cup.fill()
		get_tree().call_group("ball2", "apply_force", force)
		get_tree().call_group("ball2", "evaporate")

func _on_special_ball_timer_timeout() -> void:
	var special_keys = Utils.special_keys_scn.instantiate()
	special_keys.global_position = special_ball_marker.global_position
	Utils.add_main(special_keys)
	special_ball_timer.wait_time = randi_range(special_timer_low, special_timer_high)
	special_ball_timer.start()
