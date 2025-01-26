extends Node2D

@onready var bubble_t: Sprite2D = $"Ball T/BubbleT"
@onready var bubble_b: Sprite2D = $"Ball B/BubbleB"

var bubble_sprite
var rotating_side_b: int
var rotating_side_t: int

func _ready() -> void:
	if randf() < 0.5:
		rotating_side_b = 1
		rotating_side_t = -1
	else:
		rotating_side_t = -1
		rotating_side_b = 1
	
func _process(delta: float) -> void:
	bubble_t.rotation_degrees += randf_range(15, 30) * rotating_side_t * delta
	bubble_b.rotation_degrees += randf_range(15, 30) * rotating_side_b * delta

# Checks user input
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		# B pressed first
		if event.pressed and event.keycode == KEY_B:
			#var nodes = get_tree().get_nodes_in_group("cup"+str(id))
			Globals.P2_score += 10
			hit(Globals.P2_cup)
		if event.pressed and event.keycode == KEY_T:
			#var nodes = get_tree().get_nodes_in_group("cup"+str(id))
			Globals.P1_score += 10
			hit(Globals.P1_cup)

# called when you successfully hit the according KEY
func hit(cup: Cup) -> void:
	GlobalAudio.play_random_bubble()

	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_special()
	Utils.add_main(txt)
	spawn_bubble(cup)
	destroy()

func destroy() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	queue_free()

func spawn_bubble(cup: Cup) -> void:
	var ball = Utils.specialball_scn.instantiate()
	ball.global_position = global_position
	Utils.add_main(ball)
	ball.add_to_group("ball"+str(cup.id))
	var dir
	if cup.id == 1:
		dir = -1
	else:
		dir = 1
	
	ball.apply_force(Vector2(100*dir, -100))
