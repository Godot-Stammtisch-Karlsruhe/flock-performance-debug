extends Node

@export var scanner: NeighborScanner
@export var weight := 1.0
var boid: Node2D
var result: Vector2
var diff_vector := Vector2.ZERO


func _ready():
	assert(scanner)
	boid = get_parent()

func _process(delta):
	var steer = Vector2.ZERO
	var count = 0
	for other_boid in scanner.neighbors:
		diff_vector = boid.global_position - other_boid.global_position;
		var away = diff_vector.normalized() * (10000 / diff_vector.length_squared())
		
		steer += away
		count += 1

	if count > 0:
		steer = steer / count

	result = steer * weight

	#DebugVector.add(result, boid.global_position, Color.CHOCOLATE)



