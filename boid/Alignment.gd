extends Node

@export var scanner: NeighborScanner
@export var weight := 1.0
var result := Vector2.ZERO
var boid: Node2D

func _ready():
	assert(scanner)
	boid = get_parent()

func _process(delta):
	var rotation := 0.0
	var count := 0
	for other in scanner.neighbors:
		count += 1
		rotation += other.global_rotation

	if count > 0:
		result = Vector2.from_angle(rotation / count)
	else:
		result = Vector2.from_angle(boid.global_rotation)
		
	result *= weight
		
	#DebugVector.add(result, boid.global_position, Color.CADET_BLUE)
