extends Area3D

var direction:= Vector3.FORWARD

@export var speed:=30.0

func _physics_process(delta: float) -> void:
	global_position+=direction*speed*delta


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		area.get_parent().health-=1
		queue_free()
