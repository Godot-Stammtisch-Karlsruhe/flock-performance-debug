extends Node2D

var active := false

var vectors: Array[Vector2] = []
var origins: Array[Vector2] = []
var colors: Array[Color] = []

func add(v: Vector2, pos: Vector2, col: Color = Color.FIREBRICK):
	if !active:
		return
	vectors.push_back(v)
	origins.push_back(pos)
	colors.push_back(col)
	queue_redraw()

func draw():
	if !active: 
		return
	for i in vectors.size():
		draw_line(origins[i], origins[i] + vectors[i] * 200, colors[i])
	vectors.clear()
	origins.clear()
	colors.clear()
	
func _draw():
	draw()
	
func _process(delta):
	if Input.is_action_just_pressed("debug_toggle"):
		active = !active
