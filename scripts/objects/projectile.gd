extends Node2D
class_name Projectile
@onready var sprite: Sprite2D = $Sprite
@export var rotation_deg : float
@export var speed : float = 15
@export var _3d : bool
var moving_direction : Vector2
var player: Player

signal color_found(int)

func _ready() -> void:
	connect_to_player()

func connect_to_player() -> void:
	var scene_root = get_tree().current_scene
	var found_player
	if _3d == false:
		found_player = scene_root.get_node("Player")
	else:
		found_player = scene_root.get_node("Sprite3D/SubViewport/MainScene/Player")
	
	if found_player and found_player is Player:
		player = found_player
		color_found.connect(player._on_color_hit)
		#print("Connected to Player and signal connected.")
	else:
		#print("Player not found.")
		pass
		
func _process(delta: float) -> void:
	sprite.rotate(deg_to_rad(rotation_deg))
	if moving_direction != null:
		global_position += (moving_direction*speed* delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()


func _on_hitbox_component_area_entered(area: Area2D) -> int:
	if area is not HurtboxComponent:
		return 0
	if area.get_parent() is not Enemy:
		return 0
	#retrieve color information
	var enemy = area.get_parent()
	var health_component = enemy.get_node("HealthComponent")
	var color_hit = health_component.color
	
	#print("color = ", color_hit)
	color_found.emit(color_hit)
	self.queue_free()
	return color_hit
	
