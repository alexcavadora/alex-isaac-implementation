extends Node2D
class_name HealthComponent

@onready var health_bar: ProgressBar = $HealthBar
@export var max_hp : float 
@export var hp : float

func apply_damage(incoming_dmg: float) -> void:
	hp -= incoming_dmg
	if hp == 0.0:
		die()

func apply_heal(incoming_heal: float) -> void:
	if max_hp <= (hp + incoming_heal):
		hp += incoming_heal

func die():
	self.queue_free()

func _ready() -> void:
	health_bar.max_value = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health_bar.value = hp
