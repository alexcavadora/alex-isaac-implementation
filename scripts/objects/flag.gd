extends Node2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@export var debug_previous: Array[int] = [0,0]

var current_color = "white"

"""
white: 0, blue: 1, red: 2, yellow: 3
"""
const COLOR_COMBINATIONS = {
	[1, 1]: "blue",
	[2, 2]: "red",
	[3, 3]: "yellow",
	[1, 2]: "purple",
	[2, 3]: "orange",
	[1, 3]: "green"
}

func _ready() -> void: #loading a saved state 
	update_color(debug_previous)

func update_color(previous_colors: Array[int]) -> String:
	var color1 = previous_colors[0]
	var color2 = previous_colors[1]

	# empty state
	if color1 == 0 and color2 == 0:
		current_color = "white"
		sprite_2d.play("white")
		return current_color
	
	# first ever color entered (color2) gets duplicated to simplify mapping
	if color1 == 0:
		color1 = color2

	# sort pair to make mapping order-independent
	var key = [color1, color2] if color1 < color2 else [color2, color1]
	
	# lookup result
	current_color = COLOR_COMBINATIONS[key]
	
	# update sprite
	sprite_2d.play(current_color)
	
	#if needed returns the color in string
	return current_color

func _on_color_queue_updated(color_queue : Array[int]):
	update_color(color_queue)
