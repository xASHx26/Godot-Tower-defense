extends CanvasLayer

@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")
@onready var goal=get_tree().get_first_node_in_group("goal")
@onready var _1_st_star: Sprite2D = $"CenterContainer/PanelContainer/VBoxContainer2/1stStar"
@onready var _2_nd_star: Sprite2D = $"CenterContainer/PanelContainer/VBoxContainer2/2ndStar"
@onready var _3_rd_star: Sprite2D = $"CenterContainer/PanelContainer/VBoxContainer2/3rdStar"
@onready var label: Label = $CenterContainer/PanelContainer/VBoxContainer/Label

var paused:=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func victory()->void:
	if bank.current_gold>=500:
		_3_rd_star.modulate=Color.WHITE
	if base.current_health==base.max_health:
		_2_nd_star.modulate=Color.WHITE
	visible=true
	


func _on_retry_button_pressed() -> void:
	
	get_tree().reload_current_scene()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
func defetedd() -> void:
	visible = true
	pausedManu()
	_1_st_star.visible = false
	_2_nd_star.visible = false
	_3_rd_star.visible = false
	label.text = "Defeated"
func pausedManu():
	if paused:
		Engine.time_scale=1
	else :
		Engine.time_scale=0
	paused=!paused

func goal_seq(next_level_file)->void:
	var tween =create_tween()
	tween.tween_interval(1.5)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
func _on_exit_button_2_pressed() -> void:
	goal_seq(goal.file_path)
	
