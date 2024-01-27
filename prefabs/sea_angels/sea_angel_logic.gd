extends Node2D
class_name SeaAngel

@export_category("Parameters")
@export var loved_foods: Array[String]
@export var liked_foods: Array[String]
@export var disliked_foods: Array[String]
@export var hue: float

func _ready():
	var item_data = ConfigFile.new()
	item_data.load("res://items.toml")
	
	var potential_items = []
	
	for item in item_data.get_sections():
		var type = item_data.get_value(item, 'type')
		if type != 'food':
			continue
			
		potential_items.append(item)
		
	for n in range(1):
		var random_item = potential_items.pick_random()
		potential_items.erase(random_item)
		
		loved_foods.append(random_item)
	
	for n in range(3):
		var random_item = potential_items.pick_random()
		potential_items.erase(random_item)
		
		liked_foods.append(random_item)
	
	for n in range(2):
		var random_item = potential_items.pick_random()
		potential_items.erase(random_item)
		
		disliked_foods.append(random_item)
		
	pass

func on_interaction_area_entered(area):
	
	pass
