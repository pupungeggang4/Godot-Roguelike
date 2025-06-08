extends Node

const character = {
    1: {'name': 'fire', 'energy': 5, 'hp': 60, 'attack': 0, 'hardness': 0, 'start_deck': [1, 1, 1, 1, 1, 2, 2, 2, 2, 2]}
}

const card = {
    1: {'ID': 1, 'name': 'attack', 'element': 'normal', 'rarity': 'basic', 'type': 'attack', 'energy': 1, 'effect': []},
    2: {'ID': 2, 'name': 'guard', 'element': 'normal', 'rarity': 'basic', 'type': 'util', 'energy': 1, 'effect': []},
}

const card_d = {
    1: {'ID': 1, 'name': 'attack', 'description': 'Deal 5 damage.'},
    2: {'ID': 2, 'name': 'guard', 'description': 'Gain 4 shield.'}
}
