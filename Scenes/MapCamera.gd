extends Camera3D

var lastEvPos: Vector3 = Vector3(0,0,0)

func _on_static_body_3d_input_event(camera, event, event_position, normal, shape_idx):
	#if event is InputEventMouseButton:
	#	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
	#		return
	#	position = Vector3(event_position.x, position.y, event_position.z) 
	if event is InputEventScreenTouch:
		lastEvPos = event_position
	if event is InputEventScreenDrag:
		print("drag: ", event.relative)
		
		get_parent().position += (lastEvPos - event_position).limit_length(3)
	if event is InputEventMagnifyGesture:
		print(event.delta)
	if event is InputEventPanGesture:
		get_parent().rotation.x += event.delta.y
		
