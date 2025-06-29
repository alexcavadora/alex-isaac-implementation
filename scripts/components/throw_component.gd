extends Node2D
class_name ThrowComponent

const PROJECTILE = preload("res://scenes/projectile.tscn")
@export var player : Player
@export var offset : int
var direction : Vector2

func get_orientation():
	if player.input_direction != Vector2(0.0,0.0):
		self.position = player.input_direction * offset

func input_throw():
	if Input.is_action_just_pressed("throw"):
		var scene_root = get_tree().root.get_child(0)
		var instance = PROJECTILE.instantiate()
		instance.global_position = self.global_position
		instance.moving_direction = self.global_position-player.global_position
		scene_root.add_child(instance)
		


func _process(delta):
	if player != null:
		get_orientation()
		input_throw()
