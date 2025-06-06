extends Node2D

func _ready() -> void:
    pass

func _process(delta: float) -> void:
    handle_input()
        
func handle_input():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_UI(mouse, UI.title.button_start):
            Func.change_scene(self, 'res://scene/character_select.tscn', 'CharacterSelect')
            GVar.adventure = GVar.Adventure.new()
            GVar.selected_character = -1
        elif Func.point_inside_rect_UI(mouse, UI.title.button_info):
            Func.change_scene(self, 'res://scene/info.tscn', 'Info')
        elif Func.point_inside_rect_UI(mouse, UI.title.button_challenge):
            Func.change_scene(self, 'res://scene/map.tscn', 'Map')
        elif Func.point_inside_rect_UI(mouse, UI.title.button_erase):
            Save.erase_data()
        elif Func.point_inside_rect_UI(mouse, UI.title.button_exit):
            get_tree().quit()
