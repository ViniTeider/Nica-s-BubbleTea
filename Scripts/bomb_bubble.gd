extends KeyBubble
class_name BombBubble
#
func error() -> void:
	var txt = Utils.floating_text_scn.instantiate()
	txt.global_position = global_position
	txt.set_error()
	Utils.add_main(txt)
	if parent.id == 1:
		Globals.P1_score -= 5
	else:
		Globals.P2_score -= 5
		
	var balls = get_tree().get_nodes_in_group("ball"+str(parent.id)).slice(0, 5)
	for ball in balls:
		ball.evaporate()
	destroy()
	
func destroy() -> void:
	var bubble_cloud = Utils.bubble_cloud_scn.instantiate()
	bubble_cloud.global_position = global_position
	Utils.add_main(bubble_cloud)
	parent.key_bubbles_on_screen -= 1
	parent.bubble_queue.append(key)
	parent.spawned_bubbles.erase(self)
	queue_free()
