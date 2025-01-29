extends RigidBody2D
class_name KeyBubble

@export var key_bubble_sprite: Sprite2D
@onready var bubble_sprite_2d: Sprite2D = $BubbleSprite_2D

var key
var parent: Cup
var new_size: float
var bubble_sprite
var rotating_side: int

func _ready() -> void:
	# Sets the bubble sprite
	bubble_sprite = Utils.bubble_sprites[randi_range(0, len(Utils.bubble_sprites) - 1)]
	bubble_sprite_2d.set_texture(bubble_sprite)
	if randf() < 0.5:
		rotating_side = 1
	else:
		rotating_side = -1

func _process(delta: float) -> void:
	bubble_sprite_2d.rotation_degrees += randf_range(15, 30) * rotating_side * delta

# Called when you successfully hit the according KEY
func hit() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	GlobalAudio.play_random_bubble()
	txt.set_normal()
	Utils.add_main(txt)
	spawn_tea_bubble()
	destroy()

# Called when you leave a bubble pop for itself
func error() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_error()
	Utils.add_main(txt)
	var ball = get_tree().get_first_node_in_group("ball"+str(parent.id))
	if ball:
		ball.evaporate(true)
	destroy()

# Called to destroy a bubble for whatever reasons
func destroy() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.key_bubbles_on_screen -= 1
	parent.bubble_queue.append(key)
	parent.spawned_bubbles.erase(self)
	queue_free()

# Spawns a tea bubble who falls to the corresponding cup
func spawn_tea_bubble() -> void:
	var ball = Utils.ball_scn.instantiate()
	ball.global_position = global_position
	Utils.add_main(ball)
	ball.add_to_group("ball"+str(parent.id))
	parent.add_ball(ball)
	ball.parent = parent
	
