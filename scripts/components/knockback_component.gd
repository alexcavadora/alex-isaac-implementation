extends Node
class_name KnockbackComponent
@export var target : Node2D
@export var anchor : Node2D
@export var knockback_amount : float = 1.0
@export var time_hit : float = 0.03
@export var time_cooldown: float = 0.3
var knock_tween : Tween


func knock_anim():
	var angle = (target.global_position-anchor.global_position)*knockback_amount
	reset_anim()
	knock_tween.tween_property(
		target, "position", angle, time_hit
	)
	await knock_tween.finished
	cooldown_anim()


func cooldown_anim():
	reset_anim()
	knock_tween.tween_property(
		target, "position", Vector2(0,0), time_cooldown
	)

func reset_anim():
	if knock_tween:
		knock_tween.kill()
	knock_tween = create_tween()
