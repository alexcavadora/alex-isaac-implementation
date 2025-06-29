extends CharacterBody2D
class_name Player
@export var speed = 300
@onready var sprite = $Sprite
var input_direction : Vector2

# Getting the input inside a 2D Vector and setting the velocity accordingly
func get_input_movement():
	input_direction = Input.get_vector("a_press", "d_press", "w_press", "s_press")
	#print (input_direction)
	self.velocity = input_direction * speed
	if input_direction != Vector2(0.0,0.0):
		sprite.rotation = (global_position.angle_to_point(global_position+input_direction))-1.570796 #-90 grad to rad



	
func _physics_process(delta):
	get_input_movement()
	move_and_slide()
