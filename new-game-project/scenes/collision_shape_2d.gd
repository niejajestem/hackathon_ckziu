extends CollisionShape2D

func _on_path_end_area_entered(area: Area2D) -> void:
	print("lalalalalala")
	$"../../gameUI".hp -= 10
	$"../../gameUI".damagePowerPlant()
	area.queue_free()
