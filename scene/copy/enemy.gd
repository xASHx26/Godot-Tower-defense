extends PathFollow3D

@export var speed:float =2.5
@onready var base =get_tree().get_first_node_in_group("base")
@export var max_helath:int=50
@onready var health_bar: ProgressBar = $SubViewport/ProgressBar
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank =get_tree().get_first_node_in_group("bank")
@export var enemy_reward:=50
@export var damage :int =10

var current_helth :int:
	set (health_in):
		
		current_helth=health_in
		health_bar.value =current_helth
		
		var health_percentage = float(current_helth) / float(max_helath)
		var green =Color.GREEN
		var red = Color.RED
		
		# Use lerp to interpolate from green (full health) to red (low health)
		var new_color = lerp(green, red, 1.0 - health_percentage)
		health_bar.modulate= new_color
			
		
		if current_helth <1:
			queue_free()
			bank.gold+=enemy_reward
			
		
		
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_helth=max_helath
	health_bar.max_value=max_helath
	
func take_damage() -> void:
	current_helth-=damage
	animation_player.play("damage")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress+=delta*speed
	if progress_ratio==1.0:
		base.take_damange()
		set_process(false)
		queue_free()
		
		
		
