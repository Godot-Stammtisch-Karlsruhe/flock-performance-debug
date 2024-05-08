class_name EmitWhileInput
extends Component
## Sets emitter to on while in action (e.g. a ParticleEmitter)
##
## While the selected action is pressed, the target (parent by default)
## will have it's emitting property set to true. 

## The action that is used to trigger emitting.
@export var action = 'ui_accept'
var active = false

func reparented():
	active = "emitting" in entity

func _process(_delta):
	if Input.is_action_just_pressed(action):
		entity.emitting = true
	if Input.is_action_just_released(action):
		entity.emitting = false
