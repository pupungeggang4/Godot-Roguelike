extends Control

@onready var battle = get_node('/root/Battle')
@onready var text_turn = get_node('TextTurn')

func _process(delta: float) -> void:
    text_turn.text = 'Turn : ' + str(battle.turn)
