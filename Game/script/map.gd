extends Node2D

func _ready() -> void:
    var n_cell = get_node('UI/Cell')
    for i in range(5):
        for j in range(8):
            if GVar.adventure.layout[i][j] != 0:
                var n_button = load('res://scene/thing/map_button.tscn').instantiate()
                n_button.position = Vector2(UI.map.element_start[0] + UI.map.element_interval[0] * j, UI.map.element_start[1] + UI.map.element_interval[1] * i)
                n_button.get_node('Image').texture = load('res://image/icon/Icon' + Const.map_element_list[GVar.adventure.layout[i][j]] + '.png')
                if GVar.adventure.column_next == j:
                    n_button.get_node('SelectFrame').show()
                n_cell.add_child(n_button)
                
func _process(delta: float) -> void:
    handle_ui()
    
func handle_ui() -> void:
    get_node('UI/TextTitle').text = 'Floor: %d' % [GVar.adventure.floor]
