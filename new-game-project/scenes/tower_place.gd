extends Node2D

@export var spawn_chomik = preload("res://scenes/chomik.tscn")
@export var spawn_dzik = preload("res://scenes/drwal.tscn")

func _on_button_pressed():
	$ColorRect.visible = true
	$Button.visible = false

func _on_chomik_pressed():
	$ColorRect.visible = false
	spawnTower(spawn_chomik)

func _on_dzik_pressed():
	$ColorRect.visible = false
	spawnTower(spawn_dzik)

func spawnTower(spawn):
	var position = $".".position
	var obj = spawn.instantiate()
	obj.position = position
	
	$"..".add_child(obj)
	$".".queue_free()
