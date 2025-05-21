extends Node

func point_inside_rect_array(point: Vector2, rect: Array) -> bool:
	return point.x > rect[0] and point.x < rect[0] + rect[2] and point.y > rect[1] and point.y < rect[1] + rect[3]
	
func point_inside_array(point: Array, rect: Array) -> bool:
	return point[0] >= rect[0] and point[0] < rect[0] + rect[2] and point[1] >= rect[1] and point[1] < rect[1] + rect[3]
	
func adjust_position(thing) -> void:
	thing.position = Vector2(72 + 64 * thing.coord[1], 72 + 64 * thing.coord[0])

func change_scene(current_scene: Node, scene_path: String, scene_name: String) -> void:
	var scene = load(scene_path).instantiate()
	scene.name = scene_name
	get_tree().root.remove_child(current_scene)
	current_scene.queue_free()
	get_tree().root.add_child(scene)
