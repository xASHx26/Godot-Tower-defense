extends Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export var gridmap :GridMap
@export var turret:Node3D

@export var bank =Node

@export var cost:=100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position =get_viewport().get_mouse_position()
	ray_cast_3d.target_position=project_local_ray_normal(mouse_position)*100
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		if bank.current_gold>=cost:
			Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
			var coll=ray_cast_3d.get_collider()
			if coll is GridMap:
			
						if Input.is_action_just_pressed("CLICK") :
							var coll_positon = ray_cast_3d.get_collision_point()
							var cell =gridmap.local_to_map(coll_positon)
							if gridmap.get_cell_item(cell) ==0:
								gridmap.set_cell_item(cell,1)
								var tile_postion =gridmap.map_to_local(cell)
								turret.build_turret(tile_postion)
								bank.current_gold-=cost
					
						
			#elif Input.is_action_just_pressed("un_click"):
				#var coll_position=ray_cast_3d.get_collision_point()	
				#var cell =gridmap.local_to_map(coll_position)
				#if gridmap.get_cell_item(cell)==1:
					#gridmap.set_cell_item(cell,0)
					#turret.delete()
		#
					
					
	else :
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
 
