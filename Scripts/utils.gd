extends Node

# Scenes, better to leave with var since const prevents from changing the child nodes.
var ball_scn: PackedScene = preload("res://Scenes/teabubble_scene.tscn")
var specialball_scn: PackedScene = preload("res://Scenes/ball_special.tscn")
var key_bubble_scn: PackedScene = preload("res://Scenes/key_bubble.tscn")
var cup_scn: PackedScene = preload("res://Scenes/cup_scene.tscn")
var floating_text_scn: PackedScene = preload("res://Scenes/floating_number.tscn")
var bubble_cloud_scn: PackedScene = preload("res://Scenes/bubble_cloud.tscn")
var bomb_bubble_scn: PackedScene = preload("res://Scenes/bomb_bubble.tscn")
var special_keys_scn: PackedScene = preload("res://Scenes/special_keys.tscn")
var main_scn: PackedScene = preload("res://Scenes/main.tscn")
var camerao_scn: PackedScene = preload("res://Scenes/camerao.tscn")
var restart_sign_scn: PackedScene = preload("res://Scenes/restart_sign.tscn")

# Constants

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

# Tea Bubble textures (The bubbles that falls into the cup)
const GREEN_BALL = preload("res://Assets/balls/green_ball.png")
const GREEN_BALL_VARIATION = preload("res://Assets/balls/green_ball_variation.png")
const GREY_BALL = preload("res://Assets/balls/grey_ball.png")
const GREY_BALL_VARIATION = preload("res://Assets/balls/grey_ball_variation.png")
const RED_BALL = preload("res://Assets/balls/red_ball.png")
const RED_BALL_VARIATION = preload("res://Assets/balls/red_ball_variation.png")
const REGULAR_BALL = preload("res://Assets/balls/regular_ball.png")
const REGULAR_BALL_VARIATION = preload("res://Assets/balls/regular_ball_variation.png")

var tea_bubble_sprites = [GREEN_BALL, GREEN_BALL_VARIATION, GREY_BALL, 
GREY_BALL_VARIATION, RED_BALL, RED_BALL_VARIATION, 
REGULAR_BALL, REGULAR_BALL_VARIATION]

# Special tea bubble textures
const CAPY_BALL = preload("res://Assets/SpecialBalls/capyBall.png")
const GOOFY_BALL = preload("res://Assets/SpecialBalls/goofy_ball.png")
const RABBIT_BALL = preload("res://Assets/SpecialBalls/rabbit_ball.png")
const NICA_BALL = preload("res://Assets/SpecialBalls/nicaBall.png")
const ASE_BALL = preload("res://Assets/SpecialBalls/aseBall.png")
const GODOT_BALL = preload("res://Assets/SpecialBalls/godot_ball.png")
const LUCKY_BALL = preload("res://Assets/SpecialBalls/luckyBall.png")
const MONKEY_BALL = preload("res://Assets/SpecialBalls/monkeyBall.png")
const LANTERN_BALL = preload("res://Assets/SpecialBalls/lantern_ball.png")

var special_tea_bubble_sprites = [CAPY_BALL, GOOFY_BALL, RABBIT_BALL, 
NICA_BALL, ASE_BALL, GODOT_BALL,
LUCKY_BALL, MONKEY_BALL, LANTERN_BALL]

# Key sprites
const KEYBOARD_A = preload("res://Assets/key_caps/a.png")
const KEYBOARD_D = preload("res://Assets/key_caps/d.png")
const KEYBOARD_I = preload("res://Assets/key_caps/i.png")
const KEYBOARD_J = preload("res://Assets/key_caps/j.png")
const KEYBOARD_K = preload("res://Assets/key_caps/k.png")
const KEYBOARD_L = preload("res://Assets/key_caps/l.png")
const KEYBOARD_O = preload("res://Assets/key_caps/o.png")
const KEYBOARD_S = preload("res://Assets/key_caps/s.png")
const KEYBOARD_U = preload("res://Assets/key_caps/u.png")
const KEYBOARD_C = preload("res://Assets/key_caps/c.png")
const KEYBOARD_X = preload("res://Assets/key_caps/x.png")
const KEYBOARD_Z = preload("res://Assets/key_caps/z.png")

# Bomb key sprites
const KEYBOARD_A_BOMB = preload("res://Assets/Bombs/Player_one/a_bomb.png")
const KEYBOARD_C_BOMB = preload("res://Assets/Bombs/Player_one/c_bomb.png")
const KEYBOARD_D_BOMB = preload("res://Assets/Bombs/Player_one/d_bomb.png")
const KEYBOARD_S_BOMB = preload("res://Assets/Bombs/Player_one/s_bomb.png")
const KEYBOARD_X_BOMB = preload("res://Assets/Bombs/Player_one/x_bomb.png")
const KEYBOARD_Z_BOMB = preload("res://Assets/Bombs/Player_one/z_bomb.png")
const KEYBOARD_I_BOMB = preload("res://Assets/Bombs/Player_two/i_bomb.png")
const KEYBOARD_J_BOMB = preload("res://Assets/Bombs/Player_two/j_bomb.png")
const KEYBOARD_K_BOMB = preload("res://Assets/Bombs/Player_two/k_bomb.png")
const KEYBOARD_L_BOMB = preload("res://Assets/Bombs/Player_two/l_bomb.png")
const KEYBOARD_O_BOMB = preload("res://Assets/Bombs/Player_two/o_bomb.png")
const KEYBOARD_U_BOMB = preload("res://Assets/Bombs/Player_two/u_bomb.png")

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
	
