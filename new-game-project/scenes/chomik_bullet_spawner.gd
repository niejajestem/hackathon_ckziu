extends Node2D

@export var spawn_bullet = preload("res://scenes/bullet.tscn")

var damage = 5
var reloadTime = 0.5

func _ready():
	$BulletTimer.start()
	
func _on_bullet_timer_timeout():
	if !$"..".dziks.is_empty():
		var nearestDzik = getNearestDzik()
		shoot(nearestDzik)
	
func shoot(target):
	var bullet = spawn_bullet.instantiate()
	add_child(bullet)
	bullet.damage = damage
	bullet.set_target(target)

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
