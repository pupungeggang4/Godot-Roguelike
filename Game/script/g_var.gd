extends Node

var state = ''
var state_click = ''
var menu = false
var adventure = null
var selected_character = -1

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
