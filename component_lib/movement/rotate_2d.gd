class_name Rotate2D
extends Component

@export var rotation_speed := 1.0
var rotation_direction := 0
var target: Node2D

func reparented():
	if entity is Node2D:
		target = entity
		process_mode = Node.PROCESS_MODE_INHERIT
	else:
		process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta):
	if rotation_direction != 0:
		target.rotate(rotation_direction * rotation_speed * delta)

func rotate_positive():
	rotation_direction += 1
	
func rotate_negative():
	rotation_direction -= 1	
