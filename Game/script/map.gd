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
    get_node('UI/PlayerInfo').hide()
                
func _process(delta: float) -> void:
    handle_ui()
    handle_input()
    
func handle_ui() -> void:
    get_node('UI/TextTitle').text = 'Floor: %d' % [GVar.adventure.floor]
    
func handle_input() -> void:
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if GVar.state == '':
                handle_cell(mouse)
                if Func.point_inside_rect_UI(mouse, UI.map.button_info):
                    GVar.state = 'info'
                    GVar.info_player_tab = 'profile'
                    GVar.info_player_page = 0
                    get_node('UI/PlayerInfo').show()
                    get_node('UI/PlayerInfo/Profile').show()
                    get_node('UI/PlayerInfo/Card').hide()
                    
            elif GVar.state == 'info': 
                if Func.point_inside_rect_UI(mouse, UI.map.button_info) or Func.point_inside_rect_UI(mouse, UI.map.info_close):
                    GVar.state = ''
                    get_node('UI/PlayerInfo').hide()
                    
                if Func.point_inside_rect_UI(mouse, UI.map.tab_profile):
                    GVar.info_player_tab = 'profile'
                    get_node('UI/PlayerInfo/Profile').show()
                    get_node('UI/PlayerInfo/Card').hide()
                elif Func.point_inside_rect_UI(mouse, UI.map.tab_card):
                    GVar.info_player_tab = 'card'
                    GVar.info_player_page = 0
                    get_node('UI/PlayerInfo/Profile').hide()
                    get_node('UI/PlayerInfo/Card').show()
                    get_node('UI/PlayerInfo').show_cards(GVar.player_adventure, GVar.info_player_page)
                    
                if GVar.info_player_tab == 'card':
                    if Func.point_inside_rect_UI(mouse, UI.map.info_card_button_prev):
                        if GVar.info_player_page > 0:
                            GVar.info_player_page -= 1
                            get_node('UI/PlayerInfo').show_cards(GVar.player_adventure, GVar.info_player_page)
                    if Func.point_inside_rect_UI(mouse, UI.map.info_card_button_next):
                        var max_page = ceil(len(GVar.player_adventure.deck) / 8.0) - 1
                        if GVar.info_player_page < max_page:
                            GVar.info_player_page += 1
                            get_node('UI/PlayerInfo').show_cards(GVar.player_adventure, GVar.info_player_page)

func handle_cell(mouse) -> void:
    for i in range(5):
        for j in range(8):
            var rect = [UI.map.element_start[0] + UI.map.element_interval[0] * j, UI.map.element_start[1] + UI.map.element_interval[1] * i, UI.map.element_size[0], UI.map.element_size[1]]
            if Func.point_inside_rect_UI(mouse, rect):
                if j == GVar.adventure.column_next:
                    Func.change_scene(self, 'res://scene/battle.tscn', 'Battle')
