extends Path3D


@export var enemy_scene:PackedScene
@export var diff_manager:Node

@onready var canvas_layer: CanvasLayer = $"../../CanvasLayer"



@onready var timer: Timer = $Timer

@export var victory=CanvasLayer
func _on_timer_timeout() -> void:
	var new_enemy=enemy_scene.instantiate()
	new_enemy.max_health=diff_manager.max_health()
	add_child(new_enemy)
	timer.wait_time=diff_manager.get_spawntime()
	
	new_enemy.tree_exited.connect(enemy_defted)


func _on_diffmanager_stop_spawing_enemy() -> void:
	timer.stop()
	
func  enemy_defted()->void:
	if timer.is_stopped():
		for child in get_children():
			if child is PathFollow3D:
				return	 
			
				
		canvas_layer.victory()
			
				
