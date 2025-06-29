extends Node2D
class_name Projectile
@onready var sprite: Sprite2D = $Sprite
@export var rotation_deg : float


func _process(delta: float) -> void:
	sprite.rotate(deg_to_rad(rotation_deg))
