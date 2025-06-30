extends Node2D
class_name ThrowComponent

const PROJECTILE = preload("res://scenes/characters/player/projectile.tscn")
@export var player : Player
@export var offset : int
@export var _3d : bool
@export var knockback : KnockbackComponent
var direction : Vector2


func get_orientation():
	if player.input_direction != Vector2(0.0,0.0):
		self.position = player.input_direction * offset

func input_throw():
	if Input.is_action_just_pressed("throw"):
		knockback.knock_anim()
		var scene_root 
		var instance = PROJECTILE.instantiate()
		instance.global_position = self.global_position
		instance.moving_direction = self.global_position-player.global_position
		if _3d == false:
			scene_root = get_tree().current_scene
		else:
			instance._3d = true
			scene_root = get_tree().current_scene.get_node("Sprite3D/SubViewport/MainScene")
		
		scene_root.add_child(instance)
		


func _process(_delta):
	if player != null:
		get_orientation()
		input_throw()
