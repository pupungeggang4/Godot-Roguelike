extends Node2D

@export var turn = 0
var tile = [
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null, null, null]
]
var wave = [[3, 1], [6, 1], [9, 1]]

@onready var node_player = get_node('Field/Unit/Player')
@onready var node_spawn = get_node('Field/Spawn')
@onready var node_enemy = get_node('Field/Enemy')

func _ready() -> void:
    battle_init()
    tile[5][5] = get_node('Field/Unit/Player')
    
func _process(delta: float) -> void:
    handle_input()
    if GVar.menu == false and GVar.state == '':
        handle_tick(delta)

func battle_init() -> void:
    node_player.battle_init()
    
func end_turn() -> void:
    pass
    
func enemy_turn() -> void:
    for e in node_enemy.get_children():
        e.coord[0] += 1
        Func.adjust_position(e)
    spawn_handle()
    
func spawn_handle() -> void:
    for w in wave:
        if turn >= w[0]:
            var spawn = load('res://scene/thing/spawn.tscn').instantiate()
            spawn.set_data(w[1])
            tile[0][0] = spawn
            spawn.coord = [0, 0]
            Func.adjust_position(spawn)
            node_spawn.add_child(spawn)
            wave.erase(w)
            
    for s in node_spawn.get_children():
        if s.left_turn <= 0:
            s.spawn_unit()
            node_spawn.remove_child(s)
        else:
            s.left_turn = 0
    
func start_turn() -> void:
    turn += 1
    node_player.start_turn()

func handle_tick(delta: float) -> void:
    pass
    
func handle_input() -> void:
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        handle_mouse(mouse)

func handle_mouse(mouse: Vector2) -> void:
    if GVar.menu == false:
        if Func.point_inside_rect_array(mouse, UI.battle.button_menu):
            GVar.menu = true
            get_node('Menu').show()
    elif GVar.menu == true:
        if Func.point_inside_rect_array(mouse, UI.battle.button_menu):
            GVar.menu = false
            get_node('Menu').hide()
        elif Func.point_inside_rect_array(mouse, UI.menu.button_resume):
            GVar.menu = false
            get_node('Menu').hide()
        elif Func.point_inside_rect_array(mouse, UI.menu.button_exit):
            GVar.menu = false
            get_node('Menu').hide()
            Func.change_scene(self, 'res://scene/title.tscn', 'Title')
            GVar.state = ''
