extends Node2D

var hp = 60
var hp_max = 60
var energy = 3
var energy_max = 6
var deck = []
var card = []
var status = []
var coord = [0, 0]

@onready var Battle = get_node('/root/Battle')

func _ready() -> void:
    pass
    
func _process(delta: float) -> void:
    handle_input()

func adjust_position() -> void:
    position = Vector2(72 + 64 * coord[1], 72 + 64 * coord[0])

func handle_input() -> void:
    if GVar.menu == false:
        if GVar.state == '':
            if Input.is_action_just_released('key_down'):
                coord[0] += 1
                adjust_position()
            if Input.is_action_just_released('key_up'):
                coord[0] -= 1
                adjust_position()
            if Input.is_action_just_released('key_left'):
                coord[1] -= 1
                adjust_position()
            if Input.is_action_just_released('key_right'):
                coord[1] += 1
                adjust_position()
