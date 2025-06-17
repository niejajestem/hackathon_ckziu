extends Node2D

@export var spawn_bullet = preload("res://scenes/bullet.tscn")

func _ready():
	$BulletTimer.start()
	
func _on_bullet_timer_timeout():
	spawn()
	
func spawn():
	var obj = spawn_bullet.instantiate()
	add_child(obj)
