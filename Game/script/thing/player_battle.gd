extends Node2D

const moves = {'up': [-1, 0], 'left': [0, -1], 'down': [1, 0], 'right': [0, 1]}

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
	coord = [5, 5]
	Func.adjust_position(self)
	
func _process(delta: float) -> void:
	handle_input()
	
func start_turn() -> void:
	energy += 0.5
	if energy > energy_max:
		energy = energy_max

func handle_input() -> void:
	handle_key()
	
func handle_key() -> void:
	if GVar.menu == false:
		if GVar.state == '':
			handle_key_game()
			
func handle_key_game():
	for move in moves:
		if Input.is_action_just_released(move):
			var temp_coord = [coord[0] + moves[move][0], coord[1] + moves[move][1]]
			if Func.point_inside_array(temp_coord, [1, 1, 8, 8]):
				if Battle.tile[temp_coord[0]][temp_coord[1]] == null:
					Battle.tile[coord[0]][coord[1]] = null
					coord[0] = temp_coord[0]
					coord[1] = temp_coord[1]
					Battle.tile[coord[0]][coord[1]] = self
					Battle.end_turn()
					Battle.enemy_turn()
					Battle.start_turn()
					Func.adjust_position(self)
