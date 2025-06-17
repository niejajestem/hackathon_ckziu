extends Node2D

var dziks = []

func _on_area_2d_area_entered(area: Area2D) -> void:
	var dzik = area.get_parent()
	dziks.append(dzik)

func _on_area_2d_area_exited(area: Area2D) -> void:
	var dzik = area.get_parent()
	dziks.erase(dzik)
