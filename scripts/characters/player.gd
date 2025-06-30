extends CharacterBody2D
class_name Player
@export var speed = 300
@onready var sprite = $Sprite
var input_direction : Vector2
var colors_struck : Array[int] = [0,0]

signal color_queue_updated(color_queue : Array[int])
# Getting the input inside a 2D Vector and setting the velocity accordingly
func get_input_movement(delta):
	input_direction = Input.get_vector("a_press", "d_press", "w_press", "s_press")
	#print (input_direction)
	self.velocity = input_direction * speed
	if input_direction != Vector2(0.0,0.0):
		sprite.rotation = (global_position.angle_to_point(global_position+input_direction))-1.570796 #-90 grad to rad

func _physics_process(delta):
	get_input_movement(delta)
	move_and_slide()
	

func _on_color_hit(color: int):
	#fifo structure
	colors_struck.append(color)
	colors_struck.pop_front()
	color_queue_updated.emit(colors_struck)
	#print("colors_queue: ", colors_struck)
	
