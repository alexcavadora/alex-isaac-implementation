extends CharacterBody2D
class_name Player
@export var speed = 300
@onready var sprite = $Sprite
var input_direction : Vector2

# Getting the input inside a 2D Vector and setting the velocity accordingly
func get_input_movement():
	input_direction = Input.get_vector("a_press", "d_press", "w_press", "s_press")
	self.velocity = input_direction * speed
	match input_direction.x:
		1.0:
			sprite.rotation_degrees = -90
		-1.0:
			sprite.rotation_degrees = 90
	match input_direction.y:
		1.0:
			sprite.rotation_degrees = 0
		-1.0:
			sprite.rotation_degrees = 180
	
	
func _physics_process(delta):
	get_input_movement()
	move_and_slide()
