class_name MomentumMove2D
extends Component


@export var acceleration = 10.0
@export var deceleration = 5.0
@export var max_speed = 50.0
var max_speed_squared: float
var movement_vector = Vector2.ZERO
var accelerating = false
var target: Node2D
var active = false

func start_accelerate():
	accelerating = true
	active = true
	
func stop_accelerate():
	accelerating = false

func _ready():
	max_speed_squared = max_speed * max_speed
	
func reparented():
	if entity is Node2D:
		process_mode = Node.PROCESS_MODE_INHERIT
		target = entity
	else:
		process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta):
	if !active:
		return
		
	var direction = Vector2.from_angle(target.rotation)
	var new_move = movement_vector;
	var move_normalized = new_move.normalized()
	
	# decelerate
	new_move -= move_normalized * deceleration * delta
	
	# accelerate
	if accelerating and new_move.length_squared() <= max_speed_squared:
		var add_vector = direction * acceleration * delta
		new_move += add_vector
		
	if new_move.length_squared() < 0.001:
		active = false
		movement_vector = Vector2.ZERO
	else:
		movement_vector = new_move
		
	apply_movement_vector(delta)

func apply_movement_vector(delta):
	target.position += movement_vector * delta
	
