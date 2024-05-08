class_name CameraMouseWheelZoom
extends Node

@onready var cam = get_parent() as Camera2D
@export var zoomSpeed = 0.01
@export var minZoom = 0.01
@export var maxZoom = 10

func _ready():
	assert(cam)
	assert(cam is Camera2D)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		var newZoom = cam.zoom.x
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			newZoom += zoomSpeed
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			newZoom -= zoomSpeed
		newZoom = clamp(newZoom, minZoom, maxZoom)
		cam.zoom = Vector2(newZoom, newZoom)
