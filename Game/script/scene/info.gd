extends Node2D

func _process(delta: float) -> void:
    handle_input()
    
func handle_input() -> void:
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        
        if Func.point_inside_rect_UI(mouse, UI.info.button_back):
            Func.change_scene(self, 'res://scene/title.tscn', 'Title')
