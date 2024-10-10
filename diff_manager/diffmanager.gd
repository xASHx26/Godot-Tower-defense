extends Node
signal stop_spawing_enemy
@onready var timer: Timer = $Timer
@export var game_length:=30.0
@export var spawn_time_curve:Curve
@export var  enemy_health:Curve
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(game_length)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	
func game_pogress_ratio()->float:
	return 1.0 - (timer.time_left/game_length)
func get_spawntime()->float:
	return spawn_time_curve.sample(game_pogress_ratio())
func  max_health()->float:
	return enemy_health.sample(game_pogress_ratio())


func _on_timer_timeout() -> void:
	stop_spawing_enemy.emit()
