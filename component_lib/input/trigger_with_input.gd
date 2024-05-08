@tool
class_name TriggerWithInput
extends Component

@export var triggers: Array[Trigger]
var can_trigger_on = false
var can_trigger_off = false

func reparented():
	print('reparented')
	for trigger in triggers:
		trigger.on_active = trigger.on_method != "" and entity.has_method(trigger.on_method)
		trigger.off_active = trigger.off_method != "" and entity.has_method(trigger.off_method)

func _process(_delta):
	if Engine.is_editor_hint():
		return
		
	for trigger in triggers:
		if Input.is_action_just_pressed(trigger.input) and trigger.on_active:
			entity.call(trigger.on_method)
		if Input.is_action_just_released(trigger.input) and trigger.off_active:
			entity.call(trigger.off_method)
