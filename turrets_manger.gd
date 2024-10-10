extends Node


@onready  var ground=get_tree().get_first_node_in_group("ground")
@onready  var air=get_tree().get_first_node_in_group("air")

@export var grd:PackedScene
@export var ar:PackedScene

func _on_ground_pressed() -> void:
	ground.phy=false
	air.phy=true
	


func _on_air_pressed() -> void:
	ground.phy=true
	air.phy=false
