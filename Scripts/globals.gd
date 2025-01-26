extends Node

var P1_cup: Cup = null
var P2_cup: Cup = null

var game_speed: float = 0.09
var max_game_speed: float = 0.6

var P1_score: int = 0 : 
	set(value):
		P1_score = clamp(value, 0, 100)
		P1_cup.score = P1_score
		
var P2_score: int = 0 : 
	set(value):
		P2_score = clamp(value, 0, 100)
		P2_cup.score = P2_score
