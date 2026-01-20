extends Node3D
class_name Base

@onready var health_label: Label3D = $Label3D
@export var max_health:=5
var health: int:
	set(num):
		health=num
		health_label.text=str(health)+"/"+ str(max_health)
		if num==0:
			get_tree().reload_current_scene()
func _ready() -> void:
	health=max_health
func take_damage():
	print("Damage taken")
	health-=1
