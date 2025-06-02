extends Node

func point_inside_rect_UI(pos: Vector2, rect: Array) -> bool:
    return pos.x > rect[0] and pos.x < rect[0] + rect[2] and pos.y > rect[1] and pos.y < rect[1] + rect[3]
    
func change_scene(prev: Node, path: String, name: String) -> void:
    var scene = load(path).instantiate()
    scene.name = name
    prev.get_parent().remove_child(prev)
    get_tree().root.add_child(scene)
