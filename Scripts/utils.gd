extends Node

# Scenes, better to leave with var since const prevents from changing the child nodes.
var ball_scn: PackedScene = preload("res://Scenes/ball.tscn")
var ball_special_scn: PackedScene = preload("res://Scenes/ball_special.tscn")
var key_bubble_scn: PackedScene = preload("res://Scenes/key_bubble.tscn")
var cup_scn: PackedScene = preload("res://Scenes/cup_scene.tscn")
var floating_text_scn: PackedScene = preload("res://Scenes/floating_number.tscn")
var bubble_cloud_scn: PackedScene = preload("res://Scenes/bubble_cloud.tscn")
var bomb_bubble_scn: PackedScene = preload("res://Scenes/bomb_bubble.tscn")
var special_keys_scn: PackedScene = preload("res://Scenes/special_keys.tscn")
var main_scn: PackedScene = preload("res://Scenes/main.tscn")
var camerao_scn: PackedScene = preload("res://Scenes/camerao.tscn")
var restart_sign_scn: PackedScene = preload("res://Scenes/restart_sign.tscn")
var menu_scn: PackedScene = preload("res://Scenes/menu.tscn")

# Constants

const KEYBOARD_REGION = {
	# Player 1 Keys
	"A": Vector2(0, 0),
	"S": Vector2(1, 0),
	"D": Vector2(2, 0),
	"Z": Vector2(3, 0),
	"X": Vector2(4, 0),
	"C": Vector2(5, 0),
	
	# Player 2 Keys
	"U": Vector2(0, 1),
	"I": Vector2(1, 1),
	"O": Vector2(2, 1),
	"J": Vector2(3, 1),
	"K": Vector2(4, 1),
	"L": Vector2(5, 1),
	
	# Player 1 Bomb keys
	"A_BOMB": Vector2(0, 2),
	"S_BOMB": Vector2(1, 2),
	"D_BOMB": Vector2(2, 2),
	"Z_BOMB": Vector2(3, 2),
	"X_BOMB": Vector2(4, 2),
	"C_BOMB": Vector2(5, 2),
	
	# Player 2 Bomb keys
	"U_BOMB": Vector2(0, 3),
	"I_BOMB": Vector2(1, 3),
	"O_BOMB": Vector2(2, 3),
	"J_BOMB": Vector2(3, 3),
	"K_BOMB": Vector2(4, 3),
	"L_BOMB": Vector2(5, 3),
	
	# Special Keys
	"SPECIAL_T": Vector2(0, 4),
	"SPECIAL_B": Vector2(1, 4),
}

# Z = 90, X = 88, C = 67, A = 65, S = 83, D = 68
const P1_KEYS: Array = [KEY_Z, KEY_X, KEY_C, KEY_A, KEY_S, KEY_D]

# U = 85, I = 73, O = 79, J = 74, K = 75, L = 76
const P2_KEYS: Array = [KEY_U, KEY_I, KEY_O, KEY_J, KEY_K, KEY_L]


# Bubble textures (bubble around the keys and other stuff)
const BUBBLE_1 = preload("res://Assets/bubbles/bubble1.png")
const BUBBLE_2 = preload("res://Assets/bubbles/bubble2.png")
const BUBBLE_3 = preload("res://Assets/bubbles/bubble3.png")
const BUBBLE_4 = preload("res://Assets/bubbles/bubble4.png")
const BUBBLE_5 = preload("res://Assets/bubbles/bubble5.png")
const BUBBLE_6 = preload("res://Assets/bubbles/bubble6.png")
const BUBBLE_7 = preload("res://Assets/bubbles/bubble7.png")
const BUBBLE_8 = preload("res://Assets/bubbles/bubble8.png")
const BUBBLE_9 = preload("res://Assets/bubbles/bubble9.png")
const BUBBLE_10 = preload("res://Assets/bubbles/bubble10.png")
const BUBBLE_11 = preload("res://Assets/bubbles/bubble11.png")

var bubble_sprites = [BUBBLE_1, BUBBLE_2, BUBBLE_3,
BUBBLE_4, BUBBLE_5, BUBBLE_6, 
BUBBLE_7, BUBBLE_8, BUBBLE_9, 
BUBBLE_10, BUBBLE_11]

# Cup bottom sprites
const BLUE_CUP_BOTTOM = preload("res://Assets/cups/blue/blue_cup_bottom.png")
const GREEN_CUP_BOTTOM = preload("res://Assets/cups/green/green_cup_bottom.png")
const PURPLE_CUP_BOTTOM = preload("res://Assets/cups/purple/purple_cup_bottom.png")
const RED_CUP_BOTTOM = preload("res://Assets/cups/red/red_cup_bottom.png")

# Cup top sprites
const BLUE_CUP_TOP = preload("res://Assets/cups/blue/blue_cup_top.png")
const GREEN_CUP_TOP = preload("res://Assets/cups/green/green_cup_top.png")
const PURPLE_CUP_TOP = preload("res://Assets/cups/purple/purple_cup_top.png")
const RED_CUP_TOP = preload("res://Assets/cups/red/red_cup_top.png")

# Adds a child to the main game scene.
func add_main(obj: Object) -> void:
	get_tree().current_scene.get_child(0).add_child(obj)

# Transitions the scene to another scene
func transition_to(scene_node: Node) -> void:
	if scene_node == null:
		push_error("Attempting to transition to a null node.")
	
	var transition_cam = Utils.camerao_scn.instantiate()
	get_tree().current_scene.add_child(transition_cam)
	transition_cam.set_next_scene(scene_node)
	transition_cam.transition()


# Change the sprite region 
func update_sprite_region(sprite: Sprite2D, frame_coord: Vector2, width: int, height: int):
	sprite.region_rect = Rect2(frame_coord.x * width, frame_coord.y * height, width, height)
