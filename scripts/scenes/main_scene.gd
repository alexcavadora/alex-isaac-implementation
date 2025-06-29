extends Node2D

func _input(_event):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func _on_rtx_button_pressed() -> void:
	pass # Replace with function body.
