extends CollisionShape2D

func _on_path_end_area_entered(area: Area2D) -> void:
	print("lalalalalala")
	$"../../gameUI".hp -= 10
	$"../../gameUI".damagePowerPlant()
	var dzik = area.get_parent()
	dzik.queue_free()
