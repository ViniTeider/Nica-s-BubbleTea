class_name KeyBubble
extends RigidBody2D

const KEY_WIDTH = 44
const KEY_HEIGHT = 48

var key
var parent: Cup
var new_size: float
var bubble_sprite
var rotating_side: int

@onready var key_sprite: Sprite2D = $KeySprite
@onready var bubble_sprite_2d: Sprite2D = $BubbleSprite_2D

func _ready() -> void:
	# Sets the bubble sprite
	bubble_sprite = Utils.bubble_sprites[randi_range(0, len(Utils.bubble_sprites) - 1)]
	bubble_sprite_2d.set_texture(bubble_sprite)
	if randf() < 0.5:
		rotating_side = 1
	else:
		rotating_side = -1


func _process(delta: float) -> void:
	key_sprite.rotation_degrees += randf_range(15, 30) * rotating_side * delta

# Called when you successfully hit the according KEY
func hit() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	GlobalAudio.play_random_bubble()
	txt.set_normal()
	Utils.add_main(txt)
	spawn_tea_bubble()
	destroy()

# Called when you leave a bubble pop for itself
func error() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_error()
	Utils.add_main(txt)
	var ball = get_tree().get_first_node_in_group("ball"+str(parent.id))
	if ball:
		ball.evaporate(true)
	destroy()

# Called to destroy a bubble for whatever reasons
func destroy() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.key_bubbles_on_screen -= 1
	parent.bubble_queue.append(key)
	parent.spawned_bubbles.erase(self)
	queue_free()

# Spawns a tea bubble who falls to the corresponding cup
func spawn_tea_bubble() -> void:
	var ball = Utils.ball_scn.instantiate()
	ball.global_position = global_position
	Utils.add_main(ball)
	ball.add_to_group("ball"+str(parent.id))
	parent.add_ball(ball)
	ball.parent = parent



func set_key_sprite(_key: int, isBomb: bool = false) -> void:
	# # Z = 90, X = 88, C = 67, A = 65, S = 83, D = 68
	# U = 85, I = 73, O = 79, J = 74, K = 75, L = 76
	
	if isBomb:
		_key += 100
	
	match _key:
		# Player 1
		65:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["A"], KEY_WIDTH, KEY_HEIGHT)
		83:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["S"], KEY_WIDTH, KEY_HEIGHT)
		68:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["D"], KEY_WIDTH, KEY_HEIGHT)
		90:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["Z"], KEY_WIDTH, KEY_HEIGHT)
		88:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["X"], KEY_WIDTH, KEY_HEIGHT)
		67:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["C"], KEY_WIDTH, KEY_HEIGHT)
		
		# Player 2
		85:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["U"], KEY_WIDTH, KEY_HEIGHT)
		73:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["I"], KEY_WIDTH, KEY_HEIGHT)
		79:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["O"], KEY_WIDTH, KEY_HEIGHT)
		74:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["J"], KEY_WIDTH, KEY_HEIGHT)
		75:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["K"], KEY_WIDTH, KEY_HEIGHT)
		76:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["L"], KEY_WIDTH, KEY_HEIGHT)
		
		# Bomb Player 1
		165: # 65 + 100 (A)
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["A_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		183:  # 83 + 100 (S)
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["S_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		168:  # 68 + 100 (D)
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["D_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		190:  # 90 + 100 (Z)
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["Z_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		188:  # 88 + 100 (X)
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["X_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		167:  # 67 + 100 (C)
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["C_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		
		# Bomb Player 2
		185:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["U_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		173:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["I_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		179:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["O_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		174:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["J_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		175:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["K_BOMB"], KEY_WIDTH, KEY_HEIGHT)
		176:
			Utils.update_sprite_region(key_sprite, Utils.KEYBOARD_REGION["L_BOMB"], KEY_WIDTH, KEY_HEIGHT)
