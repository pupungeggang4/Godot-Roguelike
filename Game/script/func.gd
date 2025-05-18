extends Node

func point_inside_rect_array(point: Vector2, rect: Array) -> bool:
    return point.x > rect[0] and point.x < rect[0] + rect[2] and point.y > rect[1] and point.y < rect[1] + rect[3]
    
func point_inside_array(point: Array, size: Array) -> bool:
    return point[0] >= 0 and point[0] < size[0] and point[1] >= 0 and point[1] < size[1]

func change_scene(current_scene: Node, scene_path: String, scene_name: String) -> void:
    var scene = load(scene_path).instantiate()
    scene.name = scene_name
    get_tree().root.remove_child(current_scene)
    current_scene.queue_free()
    get_tree().root.add_child(scene)
