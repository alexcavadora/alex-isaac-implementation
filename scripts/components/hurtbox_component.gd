extends Area2D
class_name HurtboxComponent
@export var health_comp : HealthComponent
@export var can_get_hit : bool
@export var can_heal : bool
@export var knockback : KnockbackComponent


func _on_area_entered(area: Area2D) -> void:
	if area is not HitboxComponent:
		return
		
	if health_comp != null:
		if area.heals and can_heal:
			health_comp.apply_heal(area.value)
		if area.damages and can_get_hit:
			if knockback != null:
				var buffer = area
				knockback.anchor = buffer 
				knockback.knock_anim()
			health_comp.apply_damage(area.value)
			
