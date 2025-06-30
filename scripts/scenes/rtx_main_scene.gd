extends Node3D
const MAIN_SCENE = preload("res://scenes/levels/main_scene.tscn")
@onready var directional_light_3d: DirectionalLight3D = $DirectionalLight3D
@export var x_rot_speed : float = 0.025
@export var y_rot_speed : float = 0.02


func _input(_event):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _process(_delta):
	directional_light_3d.rotation_degrees.x += x_rot_speed
	directional_light_3d.rotation_degrees.y += y_rot_speed
	
