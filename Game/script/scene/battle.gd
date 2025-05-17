extends Node2D

func _ready() -> void:
    pass
    
func _process(delta: float) -> void:
    handle_input()
    if GVar.menu == false and GVar.state == '':
        handle_tick(delta)

func handle_tick(delta: float) -> void:
    pass
    
func handle_input() -> void:
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_array(mouse, UI.battle.button_menu):
                GVar.menu = true
                get_node('Menu').show()
        elif GVar.menu == true:
            if Func.point_inside_rect_array(mouse, UI.battle.button_menu):
                GVar.menu = false
                get_node('Menu').hide()
