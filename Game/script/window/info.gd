extends Control

@onready var text_level = get_node('TextLevel')
@onready var text_exp = get_node('TextExp')
@onready var text_hp = get_node('TextHP')
@onready var text_energy = get_node('TextEnergy')
@onready var text_gold = get_node('TextGold')

func _process(delta: float) -> void:
    text_level.text = 'Lv.%d' % [Player.level]
    text_exp.text = 'Exp:%d/%d' % [Player.exp, Player.exp_max]
    text_hp.text = 'HP:%d' % [Player.hp]
    text_energy.text = 'Energy:%d' % [Player.energy]
    text_gold.text = 'Gold:%d' % [Player.gold]
