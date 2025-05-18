extends Node2D

const img_list = {
    1: 'ButtonStart.png', 2: 'ButtonBattle.png', 3: 'ButtonEvent.png',
    4: 'ButtonShop.png', 5: 'ButtonBoss.png'
}
@export var map_element = [
    [0, 2, 3, 2, 4, 2, 3, 0],
    [0, 2, 2, 2, 3, 2, 3, 0],
    [1, 2, 2, 3, 4, 2, 3, 5],
    [0, 2, 2, 2, 4, 2, 3, 0],
    [0, 2, 3, 2, 3, 2, 3, 0]
]

func _ready() -> void:
    var node_element = get_node('Element')
    for i in range(len(map_element)):
        for j in range(len(map_element[0])):
            if map_element[i][j] != 0:
                var node_button = TextureRect.new()
                node_button.texture = load('res://image/' + img_list[map_element[i][j]])
                node_button.position = Vector2(UI.map.element_start[0] + UI.map.element_interval[0] * j, UI.map.element_start[1] + UI.map.element_interval[1] * i)
                node_element.add_child(node_button)

func _process(delta: float) -> void:
    handle_input()

func handle_input() -> void:
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        handle_mouse(mouse)
        
func handle_mouse(mouse: Vector2) -> void:
    if Func.point_inside_rect_array(mouse, UI.map.button_back):
        Func.change_scene(self, 'res://scene/title.tscn', 'Title')

    if GVar.state == '':
        if Func.point_inside_rect_array(mouse, UI.map.button_info):
            GVar.state = 'info'
            get_node('Info').show()
            
        for i in range(5):
            for j in range(8):
                if Func.point_inside_rect_array(mouse, [UI.map.element_start[0] + UI.map.element_interval[0] * j, UI.map.element_start[1] + UI.map.element_interval[1] * i, UI.map.element_size[0], UI.map.element_size[1]]):
                    if j == Player.dungeon_column:
                        Player.dungeon_column += 1
                        if map_element[i][j] == 2:
                            GVar.state = ''
                            Func.change_scene(self, 'res://scene/battle.tscn', 'Battle')
                            
    elif GVar.state == 'info':
        if Func.point_inside_rect_array(mouse, UI.map.button_info):
            GVar.state = ''
            get_node('Info').hide()
