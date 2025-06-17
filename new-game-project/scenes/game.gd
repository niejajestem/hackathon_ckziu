extends Node

@export var spawn_dzik = preload("res://scenes/dzik.tscn")


var coal = 0
var secondsPassed = 0
var dzikCount = 0
var wave = 1

func _on_timer_timeout() -> void:
	secondsPassed += 1
	coal += 1
	$coalCounter.text = "%d" % coal

func finishWave():
	wave += 1
	dzikCount = 3*wave
	coal += 10*wave
	print("Wave %d" % wave)
	
	_on_dzik_spawn_timer_timeout()


func _on_path_2d_child_exiting_tree(node: Node) -> void:
	print("Killed a dzik")
	coal += 5
	
	print($"../Path2D".get_child_count())
	if $"../Path2D".get_child_count() == 1: # 1, bo count sie zmniejsza dopiero po wywolaniu tej funkcji
		print("Killed all dziks")
		finishWave()
		


func _on_dzik_spawn_timer_timeout() -> void:
	if $"../Path2D".get_child_count() != dzikCount:
		var dzik = spawn_dzik.instantiate()
		$"../Path2D".add_child(dzik)
		print("Spawned a dzik")
		print($"../Path2D".get_children())
