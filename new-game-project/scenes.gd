extends TextureButton

func _on_mouse_entered() -> void:
	scale.x = 1.2
	scale.y = 1.2
	modulate = "#ffffff"


func _on_mouse_exited() -> void:
	scale.x = 1.0
	scale.y = 1.0
	modulate = "#cccccc"
