extends Camera3D

func _on_static_body_3d_input_event(camera, event, event_position, normal, shape_idx):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			return
		position = Vector3(event_position.x, position.y, event_position.z) 
	pass # Replace with function body.
