extends Node

# Scenes
const ball_scn: PackedScene = preload('res://teabubble_scene.tscn')
const specialball_scn: PackedScene = preload("res://ball_special.tscn")
const key_bubble_scn: PackedScene = preload("res://key_bubble.tscn")
const cup_scn: PackedScene = preload("res://cup_scene.tscn")
const floating_text_scn: PackedScene = preload("res://floating_number.tscn")
const bubble_cloud_scn: PackedScene = preload("res://bubble_cloud.tscn")
const bomb_bubble_scn: PackedScene = preload("res://bomb_bubble.tscn")
const special_keys_scn = preload("res://special_keys.tscn")
const main_scn = preload("res://main.tscn")
const camerao_scn = preload("res://camerao.tscn")
const restart_sign_scn = preload("res://restart_sign.tscn")

# Constants

# Z = 90, X = 88, C = 67, A = 65, S = 83, D = 68
const P1_KEYS: Array = [KEY_Z, KEY_X, KEY_C, KEY_A, KEY_S, KEY_D]

# U = 85, I = 73, O = 79, J = 74, K = 75, L = 76
const P2_KEYS: Array = [KEY_U, KEY_I, KEY_O, KEY_J, KEY_K, KEY_L]

# Adds a child to the main game scene.
func add_main(obj: Object) -> void:
	get_tree().root.get_node("Main").add_child(obj)
	
