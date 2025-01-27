extends AudioStreamPlayer

const BUBBLE_SOUND_1 = preload("res://Sounds/bubbleSounds/bubble_hit1.mp3")
const BUBBLE_SOUND_2 = preload("res://Sounds/bubbleSounds/bubble_hit2.mp3")
const BUBBLE_SOUNDSPECIAL = preload("res://Sounds/bubbleSounds/bubble_soundspecial.mp3")
const BOMB_EXPLODING = preload("res://Sounds/bubbleSounds/bomb_exploding.mp3")
const SPECIAL_BALLS_SOUND = preload("res://Sounds/bubbleSounds/bubble_soundspecial.mp3")

var bubble_hit_sounds: Array = [BUBBLE_SOUND_1, BUBBLE_SOUND_2]

func play_random_bubble() -> void:
	stream = bubble_hit_sounds[randi_range(0, len(bubble_hit_sounds)-1)]
	play()

func bomb_exploding_sound() -> void:
	stream = BOMB_EXPLODING
	play()

func special_balls_sound() -> void:
	stream = SPECIAL_BALLS_SOUND
	play()
