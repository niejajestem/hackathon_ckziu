extends PathFollow2D

var speed = 0.53
var health = 1

func _process(delta: float) -> void:
	progress_ratio += delta * speed

func test():
	print("dziaua")

func getHurt(damage):
	if health > damage:
		health -= damage
	else:
		$".".queue_free()
