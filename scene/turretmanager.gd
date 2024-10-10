extends Node3D

@export var turret :PackedScene
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

@export var enemy_path:Path3D


func build_turret(turret_position:Vector3) -> void:
	
		var new_turret =turret.instantiate()
		add_child(new_turret)
		new_turret.global_position=turret_position
		audio_stream_player_3d.play()
		new_turret.enemy_path=enemy_path

		

func delete()->void:
	queue_free()
