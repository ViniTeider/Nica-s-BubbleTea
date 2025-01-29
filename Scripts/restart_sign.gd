extends Node2D

@export var rich_text_label: RichTextLabel

var prefix: String = "[b][wave amp=50.0 freq=5.0 connected=1]"
var middle: String = "[rainbow freq=1.0 sat=0.8 val=0.8]"
var sufix: String = "[/rainbow][/wave][/b]"
var final_text: String

@onready var texture_button: TextureButton = $TextureButton
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("chegando")


func _on_texture_button_pressed() -> void:
	animation_player.play("indo")


func set_text(txt: String):
	final_text = prefix + txt + middle + "GANHOU" + sufix
	rich_text_label.text = final_text


func f():
	Utils.transition_to(Utils.main_scn.instantiate())
