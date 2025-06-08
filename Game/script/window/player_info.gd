extends Control

var player = GVar.player_adventure
var card = []

func _ready() -> void:
    card.append(get_node('Card/Card1'))
    card.append(get_node('Card/Card2'))
    card.append(get_node('Card/Card3'))
    card.append(get_node('Card/Card4'))
    card.append(get_node('Card/Card5'))
    card.append(get_node('Card/Card6'))
    card.append(get_node('Card/Card7'))
    card.append(get_node('Card/Card8'))

func _process(delta: float) -> void:
    if GVar.menu == false:
        if GVar.state == '':
            get_node('Profile/TextName').text = player.name
            get_node('Profile/TextLevel').text = 'Lv.%d' % [player.level]
            get_node('Profile/TextExp').text = 'Exp: %d/%d' % [player.exp, player.exp_max]
            get_node('Profile/TextGold').text = 'Gold: %d' % [player.gold]
            get_node('Profile/TextHP').text = 'HP: %d' % [player.hp]
            get_node('Profile/TextEnergy').text = 'Energy: %d' % [player.energy]
            get_node('Profile/TextAttack').text = 'Attack: %d' % [player.attack]
            get_node('Profile/TextHardness').text = 'Hardness: %d' % [player.hardness]

func show_cards(player, page) -> void:
    for i in range(8):
        var index = page * 8 + i
        if index < len(player.deck):
            card[i].show()
            card[i].show_data(player.deck[index])
        else:
            card[i].hide()
