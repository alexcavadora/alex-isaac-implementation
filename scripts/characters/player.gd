extends CharacterBody2D
class_name Player
@export var speed = 300

# Getting the input inside a 2D Vector and setting the velocity accordingly
func get_input_movement():
	var input_direction = Input.get_vector("a_press", "d_press", "w_press", "s_press")
	self.velocity = input_direction * speed
	

func _physics_process(delta):
	get_input_movement()
	move_and_slide()
