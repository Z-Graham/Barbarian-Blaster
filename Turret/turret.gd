extends Node3D

@export var range=10.0

var projectile=preload("res://Turret/projectile.tscn")
var enemy_path:Path3D
var target:Node3D

func _physics_process(delta: float) -> void:
	target= find_best_target()
	if target is Enemy:
		look_at(target.global_position,Vector3.UP,true)
	
func _on_timer_timeout() -> void:
	if target is Enemy:
		var proj=projectile.instantiate()
		add_child(proj)
		proj.global_position=global_position
		proj.direction=basis.z
	

func find_best_target() -> Enemy:
	var best_target=null
	var best_progress=0
	for en in enemy_path.get_children():
		if en is Enemy:
			var distance=global_position.distance_to(en.global_position)
			if distance<=range:
				if en.progress>best_progress:
					best_target=en
					best_progress=en.progress
	return best_target
