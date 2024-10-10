extends Area3D
var direction:=Vector3.FORWARD
@onready var projectile: Area3D = $"."
@onready var timer: Timer = $Timer
@onready var enemy =get_tree().get_first_node_in_group("enemy_area")


@export var speed:float =30.0
func _physics_process(delta: float) -> void:
	position =position+direction*speed*delta
	


func _on_timer_timeout() -> void: 
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		
		area.get_parent().take_damage()
		
		
		queue_free()
		


func _on_button_pressed() -> void:
	set_physics_process(false)
