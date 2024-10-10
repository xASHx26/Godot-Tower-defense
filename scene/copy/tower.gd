extends Node3D


# Called when the node enters the scene tree for the first time.
@export var porjectile:PackedScene
@export var turret_range :=10.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var turrettop: Node3D = $Cannon

@onready var TURRET_TOP: MeshInstance3D = $MeshInstance3D/MeshInstance3D2
var enemy_path:Path3D
var targrt =PathFollow3D


func _physics_process(delta: float) -> void:
	targrt =find_best_target() 
	if targrt:
		look_at(targrt.global_position,Vector3.UP,true)
	 

func _on_timer_timeout() -> void:
	
		if targrt:
			var shot =porjectile.instantiate()
			add_child(shot)
			shot.global_position=turrettop.global_position
			shot.direction=global_transform.basis.z
			animation_player.play("fire")
			
			
	
		
func find_best_target() -> PathFollow3D:
	var best_target  =null
	var best_pogress =0
	for i in enemy_path.get_children():
		if i is PathFollow3D:
			if i.progress>best_pogress:
				var distance =global_position.distance_to(i.global_position)
				if distance < turret_range:
					best_target=i
					best_pogress=i.progress
	return best_target
				
	
