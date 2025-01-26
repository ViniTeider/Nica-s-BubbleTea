extends RigidBody2D
class_name KeyBubble

@export var key_bubble_sprite: Sprite2D
@onready var bubble_sprite_2d: Sprite2D = $BubbleSprite_2D

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

var key
var parent: Cup
var new_size: float
var bubble_sprites = [BUBBLE_1, BUBBLE_2, BUBBLE_3, BUBBLE_4, BUBBLE_5, BUBBLE_6, BUBBLE_7, BUBBLE_8, BUBBLE_9, BUBBLE_10, BUBBLE_11]
var bubble_sprite
var rotating_side: int

func _ready() -> void:
	# Sets the bubble sprite
	bubble_sprite = bubble_sprites[randi_range(0, len(bubble_sprites) - 1)]
	bubble_sprite_2d.set_texture(bubble_sprite)
	if randf() < 0.5:
		rotating_side = 1
	else:
		rotating_side = -1

func _process(delta: float) -> void:
	bubble_sprite_2d.rotation_degrees += randf_range(15, 30) * rotating_side * delta

# called when you successfully hit the according KEY
func hit() -> void:
	GlobalAudio.play_random_bubble()

	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_normal()
	Utils.add_main(txt)
	spawn_bubble()
	destroy()

func error() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_error()
	Utils.add_main(txt)
	destroy()

func destroy() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.key_bubbles_on_screen -= 1
	parent.bubble_queue.append(key)
	parent.spawned_bubbles.erase(self)
	queue_free()

func spawn_bubble() -> void:
	var ball = Utils.ball_scn.instantiate()
	ball.global_position = global_position
	#if parent.id == 1:
		#Globals.P1_score += 1
	#else:
		#Globals.P2_score += 1
	Utils.add_main(ball)
	ball.add_to_group("ball"+str(parent.id))
	parent.add_ball(ball)
	ball.parent = parent
	
