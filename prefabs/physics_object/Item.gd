class_name Item extends RigidBody2D

enum ItemType { FOOD, CLEANING }

@export_category("Item")

@export_group("Item Parameters")
@export var grab_force: float = 10
@export var heaviness: float = 1
@export var type: ItemType

func _ready():
	var item_data = ConfigFile.new()
	item_data.load("res://items.toml")
	
	var image = load(item_data.get_value(name, 'image'))
	
	$Icon.texture = image
	$InteractionArea.add_to_group(name)

var hovering: bool = false
var grabbed: bool = false
	
func _process(delta):
	if Input.is_action_just_pressed("interaction"):
		if hovering:
			grabbed = true
	
	if Input.is_action_just_released("interaction"):
		grabbed = false
		hovering = false
	
	if grabbed:
		var cursor_position = get_global_mouse_position()
		var direction = global_position.direction_to(cursor_position)
		var distance = global_position.distance_to(cursor_position)
		
		set_linear_velocity(direction * distance * grab_force)

func on_mouse_entered():
	hovering = true

func on_mouse_exit():
	hovering = false
