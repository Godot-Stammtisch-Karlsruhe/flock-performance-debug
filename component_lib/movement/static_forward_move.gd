class_name StaticForwardMove
extends Component

@export var speed := 50.0
@export var target: Node2D

func reparented():
	if entity is Node2D:
		target = entity

func _process(delta):	
	var direction = Vector2.from_angle(target.rotation)
	target.position += direction * speed * delta
