extends Node3D

@onready var enemy=get_tree().get_first_node_in_group("enemy_area")
@onready var deftead=get_tree().get_first_node_in_group("victory")
@onready var base_bar: TextureProgressBar = $base_bar


@export var max_health :=5
@export var damaged:=2

var current_health:int:
	set(health_in):
		current_health=health_in
		base_bar.value=current_health
		if current_health<1:
			
			deftead.defetedd()
func _ready() -> void:
	current_health=max_health
	base_bar.max_value=max_health
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func base_damaged()->void:
	current_health-=damaged
	



	
