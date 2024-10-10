extends MarginContainer
@onready var touch_screen_button: TouchScreenButton = $TextureRect/VFlowContainer/TouchScreenButton

@export_file("*.tscn") var level
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/level1.tscn")


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/level1.tscn")
