extends Panel

var schoolScenes = ["res://Scenes/SchoolView.tscn"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_activated(index):
	get_tree().change_scene_to_file(schoolScenes[index])
