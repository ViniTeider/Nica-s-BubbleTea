extends AudioStreamPlayer

const BUBBLE_SOUND_1 = preload("res://bubbleSounds/bubble_sound1.mp3")
const BUBBLE_SOUND_2 = preload("res://bubbleSounds/bubble_sound2.mp3")
const BUBBLE_SOUNDSPECIAL = preload("res://bubbleSounds/bubble_soundspecial.mp3")
const BOMB_EXPLODING = preload("res://bubbleSounds/bomb_exploding.mp3")
const SPECIAL_BALLS_SOUND = preload("res://Assets/SpecialBalls/specialBallsSound.mp3")

var bubble_sounds: Array = [BUBBLE_SOUND_1, BUBBLE_SOUND_2]

func play_random_bubble() -> void:
	stream = bubble_sounds[randi_range(0, len(bubble_sounds)-1)]
	play()

func bomb_exploding_sound() -> void:
	stream = BOMB_EXPLODING
	play()

func special_balls_sound() -> void:
	stream = SPECIAL_BALLS_SOUND
	play()
