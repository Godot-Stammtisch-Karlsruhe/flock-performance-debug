class_name Spawner2D
extends Node2D

@export var item_to_spawn: PackedScene
@export var target_container_name = ''
var target_container: Node2D

func _ready():
	assert(item_to_spawn)
	if target_container_name == '':
		target_container_name = name + 'SpawnContainer'
	var root_node = get_tree().root.get_child(0);
	target_container = root_node.get_node_or_null(target_container_name)
	if target_container == null:
		target_container = Node2D.new();
		root_node.add_child.call_deferred(target_container);
		pass

func spawn():	
	var spawned_item = item_to_spawn.instantiate()
	target_container.add_child(spawned_item)
	if spawned_item is Node2D:
		spawned_item.global_position = global_position
		spawned_item.global_rotation = global_rotation
