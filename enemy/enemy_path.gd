extends Path3D
@onready var timer:Timer=$Timer

@export var victory_layer:CanvasLayer
@export var enemy_scene : PackedScene
@export var difficulty_manager:Node
func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)
	new_enemy.tree_exited.connect(enemy_defeated)
	timer.wait_time=difficulty_manager.get_spawn_time()
	new_enemy.health=difficulty_manager.get_enemy_health()

func enemy_defeated():
	if timer.is_stopped():
		for child in get_children():
			if child is Enemy:
				return
		victory_layer.visible=true


func _on_timer_timeout() -> void:
	spawn_enemy()


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	timer.stop()
