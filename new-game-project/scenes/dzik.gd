extends PathFollow2D

var speed = 0.03
var health = 100

func _process(delta: float) -> void:
	progress_ratio += delta * speed

func test():
	print("dziaua")

func getHurt(damage):
	if health > damage:
		health -= damage
	else:
		$".".queue_free()
