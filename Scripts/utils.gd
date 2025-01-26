extends Node

func _ready() -> void:
	seed(5)

# Scenes
var ball_scn: PackedScene = preload('res://teabubble_scene.tscn')
var key_bubble_scn: PackedScene = preload("res://key_bubble.tscn")
var cup_scn: PackedScene = preload("res://cup_scene.tscn")
var floating_text_scn: PackedScene = preload("res://floating_number.tscn")
var bubble_cloud_scn: PackedScene = preload("res://bubble_cloud.tscn")
const bomb_bubble_scn: PackedScene = preload("res://bomb_bubble.tscn")

# Constants
#const P1_KEYS: Array = [KEY_Q, KEY_W, KEY_E, KEY_A, KEY_S, KEY_D] # Q = 81, W = 87, E = 69, A = 65, S = 83, D = 68
const P1_KEYS: Array = [KEY_Z, KEY_X, KEY_C, KEY_A, KEY_S, KEY_D] # Z = 90, X = 88, C = 67, A = 65, S = 83, D = 68
const P2_KEYS: Array = [KEY_U, KEY_I, KEY_O, KEY_J, KEY_K, KEY_L] # U = 85, I = 73, O = 79, J = 74, K = 75, L = 76

# Pega a arvore, acha o main e adiciona um FILHOTE no main
func add_main(obj: Object) -> void:
	get_tree().root.get_node("Main").add_child(obj)
	
