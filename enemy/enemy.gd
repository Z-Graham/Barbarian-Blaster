extends PathFollow3D
class_name Enemy
##The speed in m/s the enemy will move
@export var speed=5
@export var max_health:=10
@onready var base = get_tree().get_first_node_in_group("Base")

var health: int:
	set(num):
		health=num
		if health<1:
			queue_free()
func _process(delta: float) -> void:
	progress+=speed*delta
	if progress_ratio==1:
		base.take_damage()
		queue_free()

func _ready() -> void:
	health=max_health
