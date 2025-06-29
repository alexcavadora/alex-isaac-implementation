extends Area2D
class_name HurtboxComponent
@export var health_comp : HealthComponent
@export var can_get_hit : bool
@export var can_heal : bool


func _on_area_entered(area: Area2D) -> void:
	if health_comp != null:
		if area is HitboxComponent:
			area.get_parent().queue_free()
			match area.heal and can_heal:
				true:
					health_comp.apply_heal(area.value)
			match area.damage and can_get_hit:
				true:
					health_comp.apply_damage(area.value)
					
