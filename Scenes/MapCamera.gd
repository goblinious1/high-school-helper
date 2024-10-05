extends Camera3D
func _input(event):
	%Console.text = str("Input Type:" + event.get_class()) + "\n" + %Console.text
	if event is InputEventMultiScreenDrag or event is InputEventScreenPinch:
		%Console.text = str("MultiDrag... Fingers:" + str(event.fingers)) + "\n" + %Console.text
	if event is InputEventSingleScreenLongPress:
		%Console.text = str("tip tap!") + "\n" + %Console.text
		return
	if (event is InputEventMultiScreenDrag and event.fingers == 3) or (event is InputEventMultiScreenDrag and event.fingers == 2 and OS.has_feature("pc")):
		%Console.text = str("AAAA! its time for camera movement since we have 3 fingers:" + str(event.fingers)) + "\n" + %Console.text
		get_parent().rotation.x += event.relative.y / 150
		return
	if event is InputEventScreenPinch and event.fingers == 2:
		position = position.move_toward(Vector3.ZERO, event.relative / 30)
		return
	if event is InputEventSingleScreenDrag:
		var move:Vector2 = event.relative/ 10
		if move.length() > 180:
			print("Canceled drag because distance was too great")
			return
		get_parent().position -= Vector3(move.x, 0, move.y)

#func _input(event):
	#if event is InputEventSingleScreenLongPress:
		#%Console.text = str("tip tap!") + "\n" + %Console.text
	#if event is InputEventMultiScreenDrag and event.fingers == 3:
		#%Console.text = str("MultiDrag!") + "\n" + %Console.text
		#get_parent().rotation.x += event.relative.y / 16000
	#if event is InputEventScreenPinch and event.fingers == 2:
		#position = position.move_toward(Vector3.ZERO, event.relative / 900)
		
