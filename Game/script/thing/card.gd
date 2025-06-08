extends Control

func show_data(card):
    get_node('TextEnergy').text = '%d' % [card.energy]
    get_node('TextName').text = card.name
    get_node('TextDescription').text = card.description
