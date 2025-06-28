extends Area2D
class_name HitboxComponent

@export var health_comp : HealthComponent
@export var can_get_hit : bool
@export var can_heal : bool

func _on_area_entered(area: Area2D) -> void:
	if health_comp != null:
		if can_get_hit == true and area is Projectile:
			health_comp.apply_damage(area.damage)
		if can_heal == true and area is HealthPickup:
			health_comp.apply_heal(area.hp)
