extends Camera3D

func _on_static_body_3d_input_event(camera, event, event_position, normal, shape_idx):
	if camera == self and event is InputEventScreenDrag:
		position += Vector3(event.screen_relative.x, event.screen_relative.y, 0) 
	pass # Replace with function body.
