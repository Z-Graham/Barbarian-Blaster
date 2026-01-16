extends PathFollow3D
##The speed in m/s the enemy will move
@export var speed=5

func _process(delta: float) -> void:
	progress+=speed*delta
