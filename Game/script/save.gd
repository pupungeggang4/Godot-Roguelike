extends Node

const empty_save = {
    'cleared': [false, false, false, false, false, false, false, false, false, false],
    'unlocked': [false, true, false, false, false, false, false, false, false, false],
    'card': [],
    'equipment': [],
    'weapon': [],
    'item': []
}

var data = {}

func _ready() -> void:
    Save.load_data()

func load_data() -> void:
    var f = FileAccess.open('user://save.txt', FileAccess.READ)
    if !f:
        f = FileAccess.open('user://save.txt', FileAccess.WRITE)
        f.store_string(str(empty_save))
        f.close()
        f = FileAccess.open('user://save.txt', FileAccess.READ)
    data = JSON.parse_string(f.get_as_text())
    
func save_data() -> void:
    var f = FileAccess.open('user://save.txt', FileAccess.WRITE)
    f.store_string(str(data))
    f.close()
    
func erase_data() -> void:
    var f = FileAccess.open('user://save.txt', FileAccess.WRITE)
    f.store_string(str(empty_save))
    f.close()
