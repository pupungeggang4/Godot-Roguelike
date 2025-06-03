extends Node

var state = ''
var state_click = ''
var menu = false
var adventure = Adventure.new()

func _ready() -> void:
    pass

class Adventure:
    var floor = 1
    var layout = [
        [0, 1, 1, 1, 1, 1, 1, 0],
        [0, 1, 1, 1, 1, 1, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [0, 1, 1, 1, 1, 1, 1, 0],
        [0, 1, 1, 1, 1, 1, 1, 0]
    ]
