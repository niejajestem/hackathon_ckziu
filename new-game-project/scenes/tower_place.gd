extends Node2D

@export var spawn_chomik = preload("res://scenes/chomik.tscn")
@export var spawn_dzik = preload("res://scenes/drwal.tscn")

func _on_button_pressed():
	$GridContainer.visible = true

func _on_chomik_pressed():
	$GridContainer.visible = false
	spawnTower(spawn_chomik)

func _on_dzik_pressed():
	$GridContainer.visible = false
	spawnTower(spawn_dzik)

func spawnTower(spawn):
	var position = $".".position
	var obj = spawn.instantiate()
	obj.position = position
	
	$"..".add_child(obj)
	$".".queue_free()
