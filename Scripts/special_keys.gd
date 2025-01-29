extends Node2D

var bubble_sprite
var rotating_side_b: int
var rotating_side_t: int
var cups: Array[Cup] = []

@onready var bubble_b: Sprite2D = $"Ball B/BubbleB"
@onready var bubble_t: Sprite2D = $"Ball T/BubbleT"

func _ready() -> void:
	SignalBus.win.connect(_on_win)
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
			hit(cups[1])
		# T pressed first???
		if event.pressed and event.keycode == KEY_T:
			hit(cups[0])


func _on_win(_winner: Cup) -> void:
	queue_free()


# called when you successfully hit the according KEY
func hit(cup: Cup) -> void:
	GlobalAudio.special_balls_sound()
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_special()
	Utils.add_main(txt)
	spawn_special_ball(cup)
	destroy()

func destroy() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	queue_free()

func spawn_special_ball(cup: Cup) -> void:
	var special_ball = Utils.ball_special_scn.instantiate()
	Utils.add_main(special_ball)
	
	special_ball.global_position = global_position
	special_ball.add_to_group("special_ball"+str(cup.id))
	
	cup.add_ball(special_ball)
	special_ball.parent = cup
	var dir
	if cup.id == 1:
		dir = -1
	else:
		dir = 1
	special_ball.apply_force(Vector2(100*dir, -100))
	
func set_cups(cup1: Cup, cup2: Cup) -> void:
	cups = [cup1, cup2]
