class_name BombBubble
extends KeyBubble

func error() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_error()
	Utils.add_main(txt)
	explode()


func explode() -> void:
	GlobalAudio.bomb_exploding_sound()
	var balls = get_tree().get_nodes_in_group("ball"+str(parent.id)).slice(0, 5)
	for ball in balls:
		ball.evaporate(true)
	destroy()
