extends Node2D
class_name HealthComponent

@onready var health_bar: ProgressBar = $HealthBar
@export var max_hp : float 
@export var hp : float
@export_enum( "BLUE", "RED", "YELLOW") var color_idx = 0
var color = 0
"""
- BLUE: 1
- RED: 2
- YELLOW: 3
"""
var fill_color : Color

func apply_damage(incoming_dmg: float) -> int:
	hp = max(0.0, hp - incoming_dmg)
	if hp == 0.0:
		die()
	update_bar()
	return color

func apply_heal(incoming_heal: float) -> void:
	hp = min(max_hp, hp + incoming_heal)
	update_bar()
	
func die():
	get_parent().queue_free()

func _ready() -> void:
	health_bar.max_value = max_hp
	health_bar.value = hp
	color = color_idx + 1 #skip white index to start at 1 (blue) for consistency with the flag indexing
	#print(color)
	update_fill_color()

func update_bar() -> void:
	health_bar.value = hp

func update_fill_color() -> void:
	# selected color from editor
	match color:
		1:  # BLUE
			fill_color = Color.SKY_BLUE
		2:  # RED
			fill_color = Color.ORANGE_RED
		3:  # YELLOW
			fill_color = Color.YELLOW
	
	# apply the color to the health bar theme
	var style_box = health_bar.get_theme_stylebox("fill").duplicate()
	style_box.bg_color = fill_color
	health_bar.add_theme_stylebox_override("fill", style_box)
