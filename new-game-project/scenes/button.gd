extends Button

func _on_pressed() -> void:
	$"..".visible = false
	$"../../Button".visible = true
