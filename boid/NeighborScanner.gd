class_name NeighborScanner
extends Area2D

var boid: Node2D
var neighbors: Array[Node2D] = []

func _ready():
	boid = get_parent()
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

func on_area_entered(other: Area2D):
	if "boid" in other and other.boid != boid:
		neighbors.push_back(other.boid)

func on_area_exited(other: Area2D):
	if "boid" in other:
		var idx = neighbors.find(other.boid)
		if idx != -1:
			neighbors.remove_at(idx)

