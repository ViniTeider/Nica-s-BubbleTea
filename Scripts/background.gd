extends Node2D

@onready var nica: AnimatedSprite2D = $Nica

func nica_look(score1: int, score2: int) -> void:
	if score1 > score2:
		nica.flip_h = false
	else:
		nica.flip_h = true
