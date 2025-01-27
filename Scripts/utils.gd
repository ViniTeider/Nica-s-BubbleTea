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

# Adds a child to the main game scene.
func add_main(obj: Object) -> void:
	get_tree().root.get_node("Main").add_child(obj)
	
