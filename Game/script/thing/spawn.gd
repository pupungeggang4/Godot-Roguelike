extends Node2D

var coord = [0, 0]
var ID = 1
var left_turn = 1

@onready var node_enemy = get_node('../../Enemy')
@onready var node_battle = get_node('/root/Battle')

func _ready():
    pass
    
func set_data(i):
    ID = i

func spawn_unit():
    var enemy = load('res://scene/thing/unit.tscn').instantiate()
    enemy.coord = [coord[0], coord[1]]
    node_battle.tile[enemy.coord[0]][enemy.coord[1]] = enemy
    Func.adjust_position(enemy)
    node_enemy.add_child(enemy)
