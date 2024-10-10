extends MarginContainer

@onready var base_bar: TextureProgressBar = $base_bar

@onready var base =get_tree().get_first_node_in_group("base")

func base_health():
	base_bar.value=base.current_health
