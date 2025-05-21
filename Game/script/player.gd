extends Node

var dungeon_floor = 0
var dungeon_column = 1

var level = 0
var gold = 0
var exp = 0
var exp_max = 0

func adventure_init() -> void:
	level = 1
	gold = 0
	exp = 0
	exp_max = 0
	dungeon_floor = 1
	dungeon_column = 1
