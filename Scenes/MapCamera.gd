extends Camera3D

var lastEvPos = null

func _on_static_body_3d_input_event(camera, event, event_position, normal, shape_idx):
	#if event is InputEventMouseButton:
	#	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
	#		return
	#	position = Vector3(event_position.x, position.y, event_position.z) 
	if event is InputEventScreenTouch:
		lastEvPos = event_position
	if event is InputEventScreenDrag and lastEvPos != null:
		var move:Vector3 = (lastEvPos - event_position)
		
		if move.length() > 180:
			print("Canceled drag because distance was too great")
			lastEvPos = null
			return
		get_parent().position += move
	if event is InputEventMagnifyGesture:
		position = position.move_toward(get_parent().position, event.delta)
	if event is InputEventPanGesture:
		get_parent().rotation.x += event.delta.y
		
