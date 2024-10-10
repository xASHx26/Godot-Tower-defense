extends Node

@onready var label: Label = $MarginContainer/Label

@export var starting_gold:=150
var current_gold:int:
	set(gold_in):
		current_gold =max(gold_in,0)
		label.text="Gold:"+str(current_gold)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_gold=starting_gold


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
