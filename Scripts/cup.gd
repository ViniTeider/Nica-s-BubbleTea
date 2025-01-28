extends StaticBody2D
class_name Cup

@export var bubble_spawn_marker: Marker2D

@onready var cup_bottom: Sprite2D = $cup_bottom
@onready var cup_top: Sprite2D = $cup_top

@onready var right_limit: Marker2D = $RightLimit
@onready var left_limit: Marker2D = $LeftLimit
@onready var cup_fill: AnimatedSprite2D = $CupFill
@onready var special_ball_spawn_point: Marker2D = $SpecialBallSpawnPoint

enum CUP_COLORS {BLUE, GREEN, PURPLE, RED}
enum BUBBLE_TYPE {NORMAL, BOMB}

var cup_keys: Array # The variables that this couple will be able to use in order to create key_bubble
var spawn_x_range: float
var key_bubbles_on_screen: int
var score: int
var bubble_queue: Array = []
var closed: bool = false
var spawned_bubbles: Array
var spawned_balls: Array
var id: int 

func _ready() -> void:
	# Selects a color for the cups
	var selected_color = (randi_range(0, len(CUP_COLORS) - 1))
	cup_bottom.set_bottom_color(selected_color) 
	cup_top.set_top_color(selected_color)
	
	cup_fill.play("Empty")
	
	if id == 2:
		score = Globals.P2_score
	
	# Marker da direita menos o marker da esquerda para pegar o range de um até o outro, uma linha com possíveis X para spawnar
	spawn_x_range = right_limit.global_position.x - left_limit.global_position.x
	
	# Populate the queue with the assigned keys
	bubble_queue = cup_keys.duplicate()
	
func _process(_delta: float) -> void:
	if score >= 60 and not closed:
		SignalBus.win.emit(self)
		closed = true
		
	score = point_sum(spawned_balls)
	if id == 1:
		Globals.P1_score = score
	else:
		Globals.P2_score = score

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
	
	if randf() < 0.5: 
		# Spawn bomb
		key_bubble = Utils.bomb_bubble_scn.instantiate()
		set_key_bubble_sprite(key_bubble, chosen_key, true)
	else:
		# Spawn Normal
		key_bubble = Utils.key_bubble_scn.instantiate()
		set_key_bubble_sprite(key_bubble, chosen_key)
	
	key_bubble.key = chosen_key
	key_bubble.parent = self
	key_bubbles_on_screen += 1
	
	key_bubble.global_position = left_limit.global_position
	key_bubble.global_position.x += randf_range(0.0, spawn_x_range)
	key_bubble.global_position.y -= randf_range(100, 220)
	
	Utils.add_main(key_bubble)
	
	key_bubble.add_to_group("cup" + str(id))
	
	# Saves the bubble into the spawned_bubbles array
	spawned_bubbles.append(key_bubble)
	

func generateRandomKey() -> int:
	bubble_queue.shuffle()
	var chosen_key:int = bubble_queue.pop_front()
	
	if chosen_key == null:
		return -1
	
	return chosen_key
	
func set_key_bubble_sprite(key_bubble: KeyBubble, key: int, isBomb: bool = false) -> void:
	# # Z = 90, X = 88, C = 67, A = 65, S = 83, D = 68
	# U = 85, I = 73, O = 79, J = 74, K = 75, L = 76
	
	if isBomb:
		key += 100
	
	match key:
		# Player 1
		90:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_Z)
		88:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_X)
		67:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_C)
		65:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_A)
		83:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_S)
		68:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_D)
		
		# Player 2
		85:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_U)
		73:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_I)
		79:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_O)
		74:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_J)
		75:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_K)
		76:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_L)
		
		# Bomb Player 1
		190:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_Z_BOMB)
		188:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_X_BOMB)
		167:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_C_BOMB)
		165:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_A_BOMB)
		183:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_S_BOMB)
		168:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_D_BOMB)
		
		# Bomb Player 2
		185:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_U_BOMB)
		173:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_I_BOMB)
		179:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_O_BOMB)
		174:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_J_BOMB)
		175:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_K_BOMB)
		176:
			key_bubble.key_bubble_sprite.set_texture(Utils.KEYBOARD_L_BOMB)
			
func fill() -> void:
	cup_fill.play("Filling")
	
func point_sum(arr: Array):
	var sum: int = 0
	for obj in arr:
		sum += obj.point
	return sum
	
func add_ball(ball: Ball) -> void:
	spawned_balls.append(ball)
	
