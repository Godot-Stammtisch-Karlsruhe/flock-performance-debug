class_name CameraKeyboardMove
extends Component

@export var up := 'ui_up'
@export var down := 'ui_down'
@export var left := 'ui_left'
@export var right := 'ui_right'
@export var speed := 50.0
var cam: Camera2D

func _ready():
	cam = entity as Camera2D
	assert(cam)

func _process(delta):
	var movement = Input.get_vector(left, right, up, down)
	cam.position += movement * delta * speed
