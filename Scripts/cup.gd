class_name Cup
extends StaticBody2D

enum CUP_COLORS {BLUE, GREEN, PURPLE, RED}
enum BUBBLE_TYPE {NORMAL, BOMB}

@export var bubble_spawn_marker: Marker2D

var cup_keys: Array # The variables that this couple will be able to use in order to create key_bubble
var spawn_x_range: float
var key_bubbles_on_screen: int
var score: int
var bubble_queue: Array = []
var closed: bool = false
var spawned_bubbles: Array
var spawned_balls: Array
var id: int
 
@onready var cup_bottom: Sprite2D = $cup_bottom
@onready var cup_top: Sprite2D = $cup_top
@onready var right_limit: Marker2D = $RightLimit
@onready var left_limit: Marker2D = $LeftLimit
@onready var cup_fill: AnimatedSprite2D = $CupFill
@onready var special_ball_spawn_point: Marker2D = $SpecialBallSpawnPoint

func _ready() -> void:
	# Selects a color for the cups
	var selected_color = (randi_range(0, len(CUP_COLORS) - 1))
	cup_bottom.set_bottom_color(selected_color) 
	cup_top.set_top_color(selected_color)
	
	cup_fill.play("Empty")
	
	# Marker da direita menos o marker da esquerda para pegar o range de um até o outro, uma linha com possíveis X para spawnar
	spawn_x_range = right_limit.global_position.x - left_limit.global_position.x
	
	# Populate the queue with the assigned keys
	bubble_queue = cup_keys.duplicate()


func _process(_delta: float) -> void:
	if score >= 60 and not closed:
		SignalBus.win.emit(self)
		closed = true
		
	score = point_sum(spawned_balls)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode in cup_keys:
			var nodes = get_tree().get_nodes_in_group("cup"+str(id))
			for bubble in nodes:
				if bubble.key == event.keycode:
					bubble.hit()
					return
			destroy_all_bubbles()


func destroy_all_bubbles() -> void:
	get_tree().call_group("cup"+str(id), "error")


func spawn_key_bubble() -> void:
	if key_bubbles_on_screen > 4:
		return

	var chosen_key = generateRandomKey()
	if chosen_key == -1: 
		return
	
	var key_bubble: RigidBody2D
	var is_bomb: bool = false
	
	if randf() < 0.5: 
		# Spawn bomb
		key_bubble = Utils.bomb_bubble_scn.instantiate()
		is_bomb = true
	else:
		# Spawn Normal
		key_bubble = Utils.key_bubble_scn.instantiate()
	
	Utils.add_main(key_bubble)
	
	key_bubble.key = chosen_key
	key_bubble.parent = self
	key_bubbles_on_screen += 1
	
	key_bubble.global_position = left_limit.global_position
	key_bubble.global_position.x += randf_range(0.0, spawn_x_range)
	key_bubble.global_position.y -= randf_range(100, 220)
	
	key_bubble.add_to_group("cup" + str(id))
	key_bubble.set_key_sprite(chosen_key, is_bomb)
	
	# Saves the bubble into the spawned_bubbles array
	spawned_bubbles.append(key_bubble)


func generateRandomKey() -> int:
	bubble_queue.shuffle()
	var chosen_key:int = bubble_queue.pop_front()
	
	if chosen_key == null:
		return -1
	
	return chosen_key


func fill() -> void:
	cup_fill.play("Filling")


func point_sum(arr: Array):
	var sum: int = 0
	for obj in arr:
		sum += obj.point
	return sum


func add_ball(ball: Ball) -> void:
	spawned_balls.append(ball)
	
