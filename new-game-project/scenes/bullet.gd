extends Node2D

var targetEnemy: Node2D = null
var speed = 300
var damage = 1


func _physics_process(delta: float):
	if targetEnemy and is_instance_valid(targetEnemy):
		var direction = (targetEnemy.global_position - global_position).normalized()
		global_position += direction * speed * delta
	else:
		queue_free()

func _on_body_entered(body: Node2D):
	if body == targetEnemy:
		queue_free()

func set_target(enemy: Node2D):
	targetEnemy = enemy

func _on_rigid_body_2d_area_entered(area: Area2D) -> void:
	var dzik = area.get_parent()
	dzik.getHurt(damage)
	queue_free()
