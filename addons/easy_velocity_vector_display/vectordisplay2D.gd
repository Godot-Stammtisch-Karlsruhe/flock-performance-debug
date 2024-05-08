extends Node2D

@export var target : NodePath
@export var target_property : String
@export var vector_scale : float = 1
@export var color: Color = Color.RED

var target_node = null

var b : Vector2 = Vector2.ZERO

func _draw():
	var base = get_tree().root.get_child(0) as Node2D
	draw_set_transform(base.position, 0, Vector2.ONE)
	draw_line(Vector2(0,0), b * vector_scale, color, 2, true)

func _ready():
	target_node = get_node(target)

func _physics_process(delta):
	b = target_node.get(target_property)
	queue_redraw()

func _unhandled_key_input(event):
	if event.keycode == KEY_V and event.pressed:
		self.visible = !self.visible
