class_name Component
extends Node

var entity: Node

func _notification(what):
	if what == NOTIFICATION_PARENTED:
		entity = get_parent()
		reparented()
		
func reparented():
	pass
