extends PathFollow3D
@onready var goblin: MeshInstance3D = $goblin
@export var speed:float =3.0
@onready var base =get_tree().get_first_node_in_group("base")
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

@onready var animation_player: AnimationPlayer = $"Area3D/Root Scene/AnimationPlayer"
@onready var bank =get_tree().get_first_node_in_group("bank")
@export var max_health: =50
@export var earning:=25
@export var damage :=30

var current_health:int:
	set(health_in):
		current_health=health_in
		if current_health <1:
			bank.current_gold+=earning
			var tween=create_tween()
			animation_player.play("EnemyArmature | EnemyArmature | EnemyArmature | Death")
			tween.tween_interval(1)
			audio_stream_player_3d.play()
			queue_free()
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health=max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	progress=progress+delta*speed
	animation_player.play("EnemyArmature | EnemyArmature | EnemyArmature | Run")
	
	if progress_ratio==1:
		set_process(false)
		base.base_damaged()
		queue_free()
func  take_damage()->void:
	current_health-=damage
	
	
	
	
