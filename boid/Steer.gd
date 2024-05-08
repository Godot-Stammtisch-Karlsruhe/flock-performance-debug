extends Node

var boid: Node2D
@export var separation: Node
@export var alignment: Node
@export var cohesion: Node

@export var move: StaticForwardMove

var steer := Vector2.ZERO

func _ready():
	boid = get_parent()
	assert("result" in separation)
	assert("result" in alignment)
	assert("result" in cohesion)
	assert(move)

func _process(delta):
	var current_steer = Vector2.from_angle(boid.global_rotation)
	steer = current_steer
	
	var new_steer: Vector2 = current_steer + separation.result + alignment.result + cohesion.result
	var lerped_rotation = lerp(current_steer.angle(), new_steer.angle(), delta * (move.speed / 50))
	
	DebugVector.add(separation.result, boid.global_position, Color.RED)
	DebugVector.add(alignment.result, boid.global_position, Color.SKY_BLUE)
	DebugVector.add(cohesion.result, boid.global_position, Color.YELLOW)
	DebugVector.add(new_steer.normalized(), boid.global_position, Color.GREEN)
	
	boid.global_rotation = lerped_rotation
	
	
