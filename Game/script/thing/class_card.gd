var ID = 0
var name = ''
var element = ''
var type = ''
var rarity = ''
var energy = 0
var effect = []
var description = ''

func _init() -> void:
    pass

func set_data(ID: int) -> void:
    var data = Data.card[ID].duplicate()
    var data_d = Data.card_d[ID].duplicate()
    self.ID = ID
    name = data['name']
    element = data['element']
    type = data['type']
    rarity = data['rarity']
    energy = data['energy']
    effect = data['effect']
    description = data_d['description']

func clone() -> Object:
    var card = GVar.Card.new()
    card.ID = ID
    card.name = name
    card.element = element
    card.type = type
    card.rarity = rarity
    card.energy = energy
    card.effect = effect
    card.description = description
    return card
