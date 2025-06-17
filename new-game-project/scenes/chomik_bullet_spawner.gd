extends Node2D

@export var spawn_bullet = preload("res://scenes/bullet.tscn")
@export var shoot_texture: Texture2D
@export var default_texture: Texture2D

var sprite = null

var damage = 5
var reloadTime = 0.5
var range = 100


func _ready():
	$BulletTimer.start()
	sprite = get_node("../Sprite2D")
	
func _process(delta: float) -> void:
	var size = range / 100
	$"../Area2D/CollisionShape2D".scale = Vector2(size, size)
	
	
func _on_bullet_timer_timeout():
	if !$"..".dziks.is_empty():
		var nearestDzik = getNearestDzik()
		shoot(nearestDzik)
	
func shoot(target):
	var bullet = spawn_bullet.instantiate()
	add_child(bullet)
	bullet.damage = damage
	bullet.set_target(target)
	sprite.texture = shoot_texture
	await get_tree().create_timer(0.2).timeout
	sprite.texture = default_texture 

func getNearestDzik():
	var dziksInRange = $"..".dziks
	if dziksInRange.is_empty() or not $"..":
		return null
	else:
		var closestDzik: Node2D = dziksInRange[0]
		var minDistanceSquared: float = $"..".global_position.distance_squared_to(closestDzik.global_position)
		
		for i in range(1, dziksInRange.size()):
			var currentDzik: Node2D = dziksInRange[i]
			var distanceSquared: float = $"..".global_position.distance_squared_to(currentDzik.global_position) 
			if distanceSquared < minDistanceSquared:
				minDistanceSquared = distanceSquared
				closestDzik = currentDzik
		return closestDzik
