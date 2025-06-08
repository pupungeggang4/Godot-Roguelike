extends Node

var ID = 0
var p_name = ''

var level = 0
var exp = 0
var exp_max = 0
var gold = 0

var hp = 0
var energy = 0
var attack = 0
var hardness = 0

var deck = []
var weapon = []
var equipment = []
var item = []

func set_data(ID: int) -> void:
    level = 1
    exp = 0
    exp_max = 50
    gold = 50
    
    var data = JSON.parse_string(str(Data.character[ID]))
    self.ID = ID
    p_name = data['name']
    hp = data['hp']
    energy = data['energy']
    attack = data['attack']
    hardness = data['hardness']
    
    deck = []
    
    for i in range(len(data['start_deck'])):
        var id = data['start_deck'][i]
        var card = GVar.Card.new()
        card.set_data(id)
        deck.append(card)
