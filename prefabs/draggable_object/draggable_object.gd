extends Node2D
class_name DraggableObject

var dragging: bool
var hovering: bool

func _on_area_2d_mouse_entered():
	hovering = true
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
func _on_area_2d_mouse_exited():
	hovering = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
func dragging_logic():
	if Input.is_action_pressed("interaction"):
		if not dragging:
			if not hovering:
				return
			
			dragging = true
			return
	else:
		dragging = false
		return

func _process(delta):
	dragging_logic()
	
	if dragging:
		global_position = lerp(global_position, get_global_mouse_position(), 10 * delta)
