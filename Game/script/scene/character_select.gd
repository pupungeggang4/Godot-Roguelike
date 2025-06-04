extends Node2D

func _ready() -> void:
    get_node('UI/SelectFrame').hide()
    var n_button = get_node('UI/Button')
    get_node('UI/TextName').text = ''
    get_node('UI/TextDescription').text = ''
    get_node('UI/TextStat').text = ''
    for i in range(9):
        var n_character = load('res://scene/thing/character_button.tscn').instantiate()
        n_character.position = Vector2(UI.character_select.button_character[i][0], UI.character_select.button_character[i][1])
        if Save.data.unlocked[i + 1] == true:
            n_character.get_node('ImageLocked').hide()
        else:
            n_character.get_node('Image').hide()
        n_button.add_child(n_character)

func _process(delta: float) -> void:
    handle_input()
    
func handle_input():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        for i in range(9):
            if Func.point_inside_rect_UI(mouse, UI.character_select.button_character[i]):
                if Save.data.unlocked[i + 1] == true:
                    get_node('UI/SelectFrame').show()
                    get_node('UI/SelectFrame').position = Vector2(UI.character_select.button_character[i][0], UI.character_select.button_character[i][1])
                    GVar.selected_character = i
                    get_node('UI/TextName').text = str(Data.character[i + 1]['name'])
                    get_node('UI/TextDescription').text = ''
                    get_node('UI/TextStat').text = 'HP: %d\nEnergy: %d\nAttack: %d\nHardness: %d' % [Data.character[i + 1]['hp'], Data.character[i + 1]['energy'], Data.character[i + 1]['attack'], Data.character[i + 1]['hardness']]
                    
        if Func.point_inside_rect_UI(mouse, UI.character_select.button_start):
            if GVar.selected_character != -1:
                Func.change_scene(self, 'res://scene/map.tscn', 'Map')
        
        if Func.point_inside_rect_UI(mouse, UI.character_select.button_back):
            Func.change_scene(self, 'res://scene/title.tscn', 'Title')
