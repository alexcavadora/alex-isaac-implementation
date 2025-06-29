extends Node2D
class_name Projectile
@onready var sprite: Sprite2D = $Sprite
@export var rotation_deg : float
@export var speed : float = 15
var moving_direction : Vector2


func _process(delta: float) -> void:
	sprite.rotate(deg_to_rad(rotation_deg))
	if moving_direction != null:
		global_position += (moving_direction*speed* delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()
