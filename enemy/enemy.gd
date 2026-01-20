extends PathFollow3D
##The speed in m/s the enemy will move
@export var speed=5

@onready var base = get_tree().get_first_node_in_group("Base")
func _process(delta: float) -> void:
	progress+=speed*delta
	if progress_ratio==1:
		base.take_damage()
		queue_free()
