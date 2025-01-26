extends Node2D

@export var timer: Timer
@export var animation_player: AnimationPlayer
@export var rich_text_label: RichTextLabel

func _ready() -> void:
	animation_player.play("fade_out")

func _on_timer_timeout() -> void:
	queue_free()

func set_special() -> void:
	rich_text_label.add_theme_font_size_override("bold_font_size", 64)
	rich_text_label.text = "[b][rainbow freq=1.0 sat=0.8 val=0.8][wave amp=50.0 freq=5.0 connected=1]+10[/wave][/rainbow][/b]"
	
func set_normal() -> void:
	rich_text_label.add_theme_font_size_override("bold_font_size", 22)
	rich_text_label.text = "[b][color=#6abe30][wave amp=50.0 freq=5.0 connected=1]+1[/wave][/color][/b]"

func set_error() -> void: 
	rich_text_label.add_theme_font_size_override("bold_font_size",22)
	rich_text_label.text = "[b][color=#d95763][wave amp=50.0 freq=5.0 connected=1]X[/wave][/color][/b]"

func set_game_end(Winner) -> void: 
	rich_text_label.add_theme_font_size_override("bold_font_size", 64)
	rich_text_label.text = "[b][rainbow freq=1.0 sat=0.8 val=0.8][wave amp=50.0 freq=5.0 connected=1]The player " + Winner + " has won![/wave][/rainbow][/b]"
