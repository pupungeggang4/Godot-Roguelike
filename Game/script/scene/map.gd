extends Node2D

@export var map_element = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1]
]

func _ready() -> void:
    var node_element = get_node('Element')
    for i in range(len(map_element)):
        for j in range(len(map_element[0])):
            if map_element[i][j] != 0:
                var node_button = TextureRect.new()
                node_button.texture = load("res://image/ButtonBattle.png")
                node_button.position = Vector2(UI.map.element_start[0] + UI.map.element_interval[0] * j, UI.map.element_start[1] + UI.map.element_interval[1] * i)
                node_element.add_child(node_button)

func _process(delta: float) -> void:
    handle_input()

func handle_input() -> void:
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_array(mouse, UI.map.button_back):
            Func.change_scene(self, 'res://scene/title.tscn', 'Title')
