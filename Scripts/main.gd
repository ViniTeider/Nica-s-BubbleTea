extends Node2D

@export var special_timer_low: int = 1
@export var special_timer_high: int = 1

var game_ended: bool = false
var cup_1: Cup = null
var cup_2: Cup = null

@onready var cup_1_marker: Marker2D = $Cup1Marker
@onready var cup_2_marker: Marker2D = $Cup2Marker
@onready var bubble_key_spawn: Timer = $BubbleKeySpawn
@onready var special_ball_timer: Timer = $SpecialBallTimer
@onready var special_ball_marker: Marker2D = $SpecialBallMarker
@onready var background: Node2D = $Background


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_game()


func _process(delta: float) -> void:
	if (bubble_key_spawn.wait_time > Globals.max_game_speed):
		bubble_key_spawn.wait_time -= delta * Globals.game_speed
		
	background.nica_look(cup_1.score, cup_2.score)


func _on_bubble_key_spawn_timeout() -> void:
	cup_1.spawn_key_bubble()
	cup_2.spawn_key_bubble()


func _on_win(winner: Cup) -> void:
	game_ended = true
	
	get_tree().call_group("cup1", "destroy")
	get_tree().call_group("cup2", "destroy")
	
	bubble_key_spawn.stop()
	bubble_key_spawn.autostart = false
	
	special_ball_timer.stop()
	special_ball_timer.autostart = false
	
	var force = Vector2(randf_range(-300, 300), -300)
	var winner_text = ""
	if cup_1 != winner:
		cup_2.fill()
		get_tree().call_group("ball1", "apply_force", force)
		get_tree().call_group("ball1", "evaporate")
		winner_text = " Player 2 "
		
	else:
		cup_1.fill()
		get_tree().call_group("ball2", "apply_force", force)
		get_tree().call_group("ball2", "evaporate")
		winner_text = " Player 1 "
		
	var restart_sign = Utils.restart_sign_scn.instantiate()
	restart_sign.set_text(winner_text)
	Utils.add_main(restart_sign)


func _on_special_ball_timer_timeout() -> void:
	var special_keys = Utils.special_keys_scn.instantiate()
	special_keys.global_position = special_ball_marker.global_position
	special_keys.tree_exited.connect(_on_special_ball_destroyed)
	special_keys.set_cups(cup_1, cup_2)
	Utils.add_main(special_keys)
	special_ball_timer.stop()


func _on_special_ball_destroyed() -> void:
	if game_ended:
		return
		
	special_ball_timer.wait_time = randi_range(special_timer_low, special_timer_high)
	special_ball_timer.start()


func setup_game() -> void:
	game_ended = false
	SignalBus.win.connect(_on_win)
	
	# Initializates the cups
	cup_1 = Utils.cup_scn.instantiate()
	cup_2 = Utils.cup_scn.instantiate()
	
	cup_1.id = 1
	cup_2.id = 2
	
	# Sets the keys for the cups
	cup_1.cup_keys = Utils.P1_KEYS
	cup_2.cup_keys = Utils.P2_KEYS
	
	cup_1.global_position = cup_1_marker.global_position
	cup_2.global_position = cup_2_marker.global_position
	
	add_child(cup_1)
	add_child(cup_2)
	
	special_ball_timer.wait_time = randi_range(special_timer_low, special_timer_high)
	special_ball_timer.start()
