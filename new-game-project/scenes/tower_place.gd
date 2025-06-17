extends Node2D

@export var spawn_tower = preload("res://scenes/tower.tscn") 

func _on_button_pressed():
	$GridContainer.visible = true


func _on_chomik_pressed():
	$GridContainer.visible = false
	spawnTower()

func _on_dzik_pressed():
	$GridContainer.visible = false
	spawnTower()

func spawnTower():
	var position = $".".position
	var obj = spawn_tower.instantiate()
	obj.position = position
	
	$"..".add_child(obj)
	$".".queue_free()
