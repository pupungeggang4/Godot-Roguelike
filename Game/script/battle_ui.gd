extends Control

@onready var battle = get_node('/root/Battle')
@onready var player = get_node('/root/Battle/Field/Unit/Player')
@onready var text_turn = get_node('TextTurn')
@onready var text_hp = get_node('TextHP')
@onready var text_energy = get_node('TextEnergy')
@onready var bar_hp = get_node('HPBarFull')
@onready var bar_energy = get_node('EnergyBarFull')
@onready var bar_exp = get_node('ExpBarFull')

func _process(delta: float) -> void:
    text_turn.text = 'Turn : ' + str(battle.turn)
    text_hp.text = '%d/%d' % [player.hp, player.hp_max]
    text_energy.text = '%.1f/%d' % [player.energy, player.energy_max]
    bar_hp.region_rect.size.x = 320.0 * player.hp / player.hp_max
    bar_energy.region_rect.size.x = 320.0 * player.energy / player.energy_max
    bar_exp.size.x = 1200.0 * player.exp / player.exp_max
