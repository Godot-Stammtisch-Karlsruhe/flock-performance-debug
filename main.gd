extends Node2D

@export var spawn_scene: PackedScene
var cnt := 0

func _ready():
	#Engine.time_scale = .1
	pass

func _process(delta):
	pass

func _unhandled_input(event):
	if spawn_scene == null:
		return
		
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			print(event.position)
			var s = spawn_scene.instantiate() as Node2D
			cnt += 1
			s.name = "Boid-" + str(cnt)
			add_child(s)
			var pos = get_global_mouse_position()
			#var pos = $Camera2D.global_position + event.position
			s.global_position = pos
			s.global_rotation = randf_range(0, 2*PI)
