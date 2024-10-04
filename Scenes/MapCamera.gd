extends Camera3D
var lastEvPos
func _on_static_body_3d_input_event(camera, event, event_position, normal, shape_idx):
	if event is InputEventScreenTouch:
		lastEvPos = event_position
		return
	if event is InputEventScreenDrag and lastEvPos != null:
		var move:Vector3 = (lastEvPos - event_position)
		
		
		if move.length() > 180:
			print("Canceled drag because distance was too great")
			lastEvPos = null
			return
		get_parent().position += move

func _input(event):
	if event is InputEventSingleScreenLongPress:
		%Console.text = str("tip tap!") + "\n" + %Console.text
	if event is InputEventMultiScreenDrag and event.fingers == 3:
		%Console.text = str("MultiDrag!") + "\n" + %Console.text
		get_parent().rotation.x += event.relative.y / 600
	if event is InputEventScreenPinch and event.fingers == 2:
		position = position.move_toward(Vector3.ZERO, event.relative / 100)
		
