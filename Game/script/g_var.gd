extends Node

var state = ''
var state_click = ''
var info_player_tab = 'profile'
var info_player_page = 0
var info_tab = 'card'
var info_tab_page = 0

var menu = false
var adventure = Adventure.new()
var player_adventure = preload('res://script/player_adventure.gd').new()
var selected_character = -1

var Card = preload('res://script/thing/class_card.gd')

func _ready() -> void:
    pass

class Adventure:
    var floor = 0
    var column_next = 0
    var layout = []
    func _init() -> void:
        self.floor = 1
        self.column_next = 1
        self.layout = [
            [0, 2, 0, 2, 0, 2, 5, 0],
            [0, 2, 0, 2, 0, 2, 5, 0],
            [1, 2, 0, 2, 0, 2, 5, 6],
            [0, 2, 0, 2, 0, 2, 5, 0],
            [0, 2, 0, 2, 0, 2, 5, 0]
        ]
        for i in range(5):
            self.layout[i][2] = randi_range(3, 4)
            self.layout[i][4] = randi_range(3, 4)
