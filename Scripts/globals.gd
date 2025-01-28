extends Node

var P1_cup: Cup = null
var P2_cup: Cup = null

var game_speed: float = 0.09
var max_game_speed: float = 0.6

func start() -> void:
	if Globals.P1_cup:
		Globals.P1_score = 0
		Globals.P1_cup.queue_free()
	
	if Globals.P2_cup:
		Globals.P2_score = 0
		Globals.P2_cup.queue_free()
		
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

var P1_score: int = 0 : 
	set(value):
		P1_score = clamp(value, 0, 100)
		if P1_cup:
			P1_cup.score = P1_score
		
var P2_score: int = 0 : 
	set(value):
		P2_score = clamp(value, 0, 100)
		if P2_cup:
			P2_cup.score = P2_score
