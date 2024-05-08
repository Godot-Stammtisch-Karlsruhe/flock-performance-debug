extends Node

@export var scanner: NeighborScanner
@export var weight := 1.0
var result := Vector2.ZERO
var boid: Node2D

func _ready():
	boid = get_parent()
	assert(scanner)

func _process(delta):
	var count := 0
	var point = Vector2.ZERO
	for other in scanner.neighbors:
		point += other.global_position
		count += 1
	
	if count > 0:
		point = point / count
		result = (point - boid.global_position).normalized()
	else:
		result = Vector2.ZERO
		
	result *= weight
	
	#DebugVector.add(result, boid.global_position, Color.PINK)
