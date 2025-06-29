extends Node3D
@onready var directional_light_3d: DirectionalLight3D = $DirectionalLight3D

func _input(_event):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _process(_delta):
	directional_light_3d.rotation_degrees.x += 0.01
	
